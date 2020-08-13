-- AI_KaruelBorder_Phase4_Dahlia.lua

ActionList =
{
	-- 대기
    {
        ID      = "WAIT",
        Motion  = "Mon_Cavalry_f_Wait.frm",
        Func    = "KaruelBorderDahlia_Phase4_WaitFunc",

        Trigger =
        {

			-- 타게팅
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_Targeting",
                DelayFrame          = 80,
            },
            -- 타겟지움
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_ReleaseTarget",
                DelayFrame          = 50,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_TurnToTarget",
                DelayFrame          = 15,
            },
            -- 걷기
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_Walk",
                DelayFrame          = 5,
            },
            -- 점프업
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_JumpUp",
                DelayFrame          = 55,
            },        
            -- 점프다운
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_JumpDown",
                DelayFrame          = 55,
            },
			-- Attack01
            {
                AICheckFrame        = 55,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_Attack01",
                DelayFrame          = 110,
            },
			-- Attack02
            {
                AICheckFrame        = 30,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_Attack02",
                DelayFrame          = 55,
            },
			-- Attack03
            {
                AICheckFrame        = 60,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_Attack03",
                DelayFrame          = 110,
            },
			-- Attack04
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_Attack04",
                DelayFrame          = 55,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Mon_Cavalry_f_run.frm",
        Func            = "KaruelBorderDahlia_Phase4_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "KaruelBorderDahlia_Phase4_MoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_Targeting",
                DelayFrame          = 40,
            },
            -- 타겟지움
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_ReleaseTarget",
                DelayFrame          = 50,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_TurnToTarget",
                DelayFrame          = 20,
            },
			-- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_Stop",
                DelayFrame          = 40,
            },
            -- 점프업
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_JumpUp",
                DelayFrame          = 55,
            },        
            -- 점프다운
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_JumpDown",
                DelayFrame          = 55,
            },
			-- Attack04
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase4_Check_Attack04",
                DelayFrame          = 50,
            },
        }
    },

    -- Attack01_Ready
    {
        ID      = "ATTACK01_READY",
        Motion  = "Mon_Cavalry_f_Attack02_Ready.frm",
        Func    = "KaruelBorderDahlia_Phase4_Attack01_ReadyFunc",
    },
	
    -- Attack01_Attack
    {
        ID      = "ATTACK01_ATTACK",
        Motion  = "Mon_Cavalry_f_Attack02_Attack.frm",
        Func    = "KaruelBorderDahlia_Phase4_Attack01_AttackFunc",
    },
    
    -- ATTACK02
    {
        ID      = "ATTACK02",
        Motion  = "Mon_Cavalry_f_Attack03.frm",
        Func    = "KaruelBorderDahlia_Phase4_Attack02Func",
    },
	
    -- Attack03
    {
        ID      = "ATTACK03",
        Motion  = "Mon_Dahlia_phase4_f_attack03.frm",
        Func    = "KaruelBorderDahlia_Phase4_Attack03Func",
    },
	
    -- Attack04
    {
        ID      = "ATTACK04",
        Motion  = "Mon_Cavalry_f_Attack01.frm",
        Func    = "KaruelBorderDahlia_Phase4_Attack04Func",
    },

    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Mon_Cavalry_f_Jump_Up.frm",
        Func    = "KaruelBorderDahlia_Phase4_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Mon_Cavalry_f_Jump_Down.frm",
        Func    = "KaruelBorderDahlia_Phase4_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Mon_Cavalry_f_Jump_Landing.frm",
        Func    = "KaruelBorderDahlia_Phase4_ToWait",
    },
	
    -- 죽기 착지
    {
        ID      = "DIE",
        Motion  = "Mon_Assassin_f_Down_Middle.frm",
        Func    = "KaruelBorderDahlia_Phase4_DieFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "OnKaruelBorderDahlia_Phase4_Land",
    Die     = "OnKaruelBorderDahlia_Phase4_Die",
    Damage  = "OnKaruelBorderDahlia_Phase4_Damage",
	DamageBeforeChange = "OnKaruelBorderDahlia_DamageBeforeChange",
	SyncDamage = "OnKaruelBorderDahlia_SyncDamage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKaruelBorder_Phase4_Dahlia( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetCountValue( 0 )
	pMonster:SetPushCheck( TRUE )
	
    if( GC_GM_QUEST55 == pMonster:GetGameMode() ) then
        local vPos = g_MyD3D:Getv3TempValue()
        pMonster:SetX( vPos.x )
        pMonster:SetY( vPos.y )
    end
	
	pMonster:EndBlur()
	pMonster:SetInitAI( true )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function KaruelBorderDahlia_Phase4_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--pMonster:RenderBox(0, -300, 50, 300, -100 )
	
	if( pMonster:GetInitAI() ) then
		pMonster:PlaySound(986001)
		g_kGlobalValue.bFrameLock = false
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_01", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_02", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_03", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_04", 0.0, 0.1 )
		pMonster:SetInitAI( false )
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function KaruelBorderDahlia_Phase4_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기
function KaruelBorderDahlia_Phase4_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 5 ) then
		pMonster:PlaySound(986001)
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_01", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_02", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_03", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_04", 0.0, 0.1 )
	elseif( iFrame == 6 ) then
		pMonster:EndMonster( true, true )
		g_MyD3D:Setv3TempValue( pMonster:GetX(), pMonster:GetY(), 0.0 )
		pMonster:SetFrameLock( true )
    end
end

-- Attack01_Ready
function KaruelBorderDahlia_Phase4_Attack01_ReadyFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:PlaySound(40010)
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK01_ATTACK" )
    end

end

-- Attack01_Attack
function KaruelBorderDahlia_Phase4_Attack01_AttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleOffset( "Dun_Karuel1_Dhalia_Run_01", 1.0, 0.2, 3 )
			pMonster:AddTraceParticleOffset( "Dun_Karuel1_Dhalia_Run_02", 1.0, 0.2, 3 )
		else
			pMonster:AddTraceParticleOffset( "Dun_Karuel1_Dhalia_Run_01", -1.2, 0.2, 3 )
			pMonster:AddTraceParticleOffset( "Dun_Karuel1_Dhalia_Run_02", -1.2, 0.2, 3 )
		end
		pMonster:AddDamage( DT_KARUELBORDER_DAHLIA_PHASE4_ATTACK01 )
		pMonster:PlaySound(40014)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- Attack02
function KaruelBorderDahlia_Phase4_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 10 ) then
			pMonster:PlaySound(986035)
	elseif( iFrame == 50 ) then
			pMonster:AddDamageWithLocate(DT_KARUELBORDER_DAHLIA_PUSH_ATTACK, 0.0, 0.0)
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(995040)
		--pMonster:AddParticle( "Dun_Karuel1_Cavalry_Breath_01", 0.55, 0.27 )
		--pMonster:AddParticle( "Dun_Karuel1_Cavalry_Breath_02", 0.55, 0.27 )
		--pMonster:AddParticle( "Dun_Karuel1_Cavalry_Breath_03", 0.55, 0.27 )
		--pMonster:AddParticle( "Dun_Karuel1_Cavalry_Breath_04", 0.55, 0.27 )
		--pMonster:AddParticle( "Dun_Karuel1_Cavalry_Breath_05", 0.55, 0.27 )
		pMonster:AddDamage( DT_KARUELBORDER_DAHLIA_PHASE4_ATTACK02 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- Attack03
function KaruelBorderDahlia_Phase4_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 13 ) then
			pMonster:PlaySound(1155)
			pMonster:PlaySound(995028)
			pMonster:AddParticle( "4th_Elesis2_Cast_01", 0.0, 0.04 )			
			pMonster:AddParticle( "4th_Elesis2_Cast_02", 0.0, 0.04 )			
			pMonster:AddParticle( "4th_Elesis2_Cast_03", 0.0, 0.04 )			
			pMonster:AddParticle( "4th_Elesis2_Cast_04", 0.0, 0.04 )					
			pMonster:AddParticle( "Dio01_Black_Start_03", 0.0, 0.4 )
			pMonster:AddParticle( "Dio01_Black_Start_04", 0.0, 0.4 )
	elseif( iFrame == 80 ) then
		g_kCamera:SetEarthQuake(25)		
			pMonster:PlaySound(81014)
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocate(DT_KARUELBORDER_DAHLIA_PHASE4_ATTACK03_R, 0.15, 0.37)
			pMonster:AddParticle( "Elesis01_Special3_Shot_01", 0.7, 0.3 )			
			pMonster:AddParticle( "Elesis01_Special3_Shot_02", 0.7, 0.3 )			
			pMonster:AddParticle( "Elesis01_Special3_Shot_03", 0.7, 0.3 )			
			pMonster:AddParticle( "Elesis01_Special3_Shot_04", 0.7, 0.3 )			
			pMonster:AddParticle( "Elesis01_Special3_Shot_05", 0.7, 0.3 )				
		else
			pMonster:AddDamageWithLocate(DT_KARUELBORDER_DAHLIA_PHASE4_ATTACK03, 0.15, 0.37)
			pMonster:AddParticle( "Elesis01_Special3_Shot_01", 0.7, 0.3 )			
			pMonster:AddParticle( "Elesis01_Special3_Shot_02", 0.7, 0.3 )			
			pMonster:AddParticle( "Elesis01_Special3_Shot_03", 0.7, 0.3 )			
			pMonster:AddParticle( "Elesis01_Special3_Shot_04", 0.7, 0.3 )			
			pMonster:AddParticle( "Elesis01_Special3_Shot_05", 0.7, 0.3 )				
		end
	elseif( iFrame > 10 and iFrame < 83 ) then	 
	    if( iFrame % 3 == 0 ) then	 
			g_kCamera:CameraVib( 0, 0.5, 1 )
		end				
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

-- Attack04
function KaruelBorderDahlia_Phase4_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(2)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Dun_Karuel1_Dahlia_Phase4_Lance_01", 0.0, 0.05 )
			pMonster:AddParticle( "Dun_Karuel1_Dahlia_Phase4_Lance_02", 0.0, 0.05 )
			pMonster:AddParticle( "Dun_Karuel1_Dahlia_Phase4_Lance_03", 0.0, 0.05 )
			pMonster:AddParticle( "Dun_Karuel1_Dahlia_Phase4_Lance_04", 0.0, 0.05 )
		else
			pMonster:AddParticle( "Dun_Karuel1_Dahlia_Phase4_Lance_01", 0.0, 0.05 )
			pMonster:AddParticle( "Dun_Karuel1_Dahlia_Phase4_Lance_02", 0.0, 0.05 )
			pMonster:AddParticle( "Dun_Karuel1_Dahlia_Phase4_Lance_03_R", 0.0, 0.05 )
			pMonster:AddParticle( "Dun_Karuel1_Dahlia_Phase4_Lance_04", 0.0, 0.05 )
		end
		pMonster:AddDamage( DT_KARUELBORDER_CAVALRY_ATTACK01_FRONT )
	elseif( iFrame == 65 ) then
		pMonster:AddDamage( DT_KARUELBORDER_CAVALRY_ATTACK01_BACK )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  점프 상태
function KaruelBorderDahlia_Phase4_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 다운 상태
function KaruelBorderDahlia_Phase4_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프에서 웨이트로 돌아가는 상태
function KaruelBorderDahlia_Phase4_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function KaruelBorderDahlia_Phase4_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -630, 800, 630, -850 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function KaruelBorderDahlia_Phase4_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -630, 800, 630, -850 ) == false or pMonster:FloatRand() > 0.5 ) then
		pMonster:ReleaseTarget( true )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase4_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase4_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -200, 500, 200, -500 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase4_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -200, 500, 200, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end


function KaruelBorderDahlia_Phase4_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -750, 960, 750, 70 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		if( KaruelBorderDahlia_Phase4_Jump( iMonsterIndex, pMonster:GetTargetX(), pMonster:GetTargetY() ) ) then
            pMonster:SetState( "JUMP" )
            pMonster:ResetDelay()
        end
	end
end

function KaruelBorderDahlia_Phase4_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( 0.5 > pMonster:GetY() ) then
		return
	end
    
	if( pMonster:CheckTargetInRange( 0, -750, -100, 750, -700 ) == true ) then
        pMonster:SetState( "JUMP_DOWN" )
        pMonster:SetNoCheckContact(15)
        pMonster:SetSpeedY( -0.01 )
        pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase4_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -400, 170, 400, -100 ) == true ) then
		pMonster:SetState( "ATTACK01_READY" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase4_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 250, -250, 170, 250, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase4_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 450, -500, 190, 500, -80 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase4_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, 50, 300, -100 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnKaruelBorderDahlia_Phase4_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end
end

function OnKaruelBorderDahlia_Phase4_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	pMonster:SetState( "DIE" )
end

function OnKaruelBorderDahlia_Phase4_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
end

function OnKaruelBorderDahlia_DamageBeforeChange( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( false == pMonster:IsBackAttack() and false == pMonster:IsSpecialAttack() ) then
		local iAbsorbHP = pMonster:GetDamageDiff() * 0.5
		pMonster:SetDamageDiff( iAbsorbHP )
		--pMonster:SetMagicEffect_NotMeBroad( iMonsterIndex, EGC_EFFECT_KARUELBORDER_DAHLIA4_GUARD, 1.0, 1 )
		pMonster:ResetDelay()
	end
end

function OnKaruelBorderDahlia_SyncDamage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( false == pMonster:IsBackAttack() and false == pMonster:IsSpecialAttack() ) then
		pMonster:AddParticle( "Dun_Karuel1_Cavalry_Shield", 0.2, 0.4 )
		pMonster:PlaySound( 753 )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase4_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:IsTarget() ) then
			if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
				pMonster:SetNoCheckContact(30)
				pMonster:SetIgnoreFHCheck(true)
				pMonster:SetState( "JUMP" )			
				pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.2 )			
				pMonster:SetSpeedY( 0.038 )			
			else
				pMonster:SetNoCheckContact(20)
				pMonster:SetIgnoreFHCheck(true)
				pMonster:SetState( "JUMP" )		
				pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.2 )
				pMonster:SetSpeedY( 0.019 )
			end
		else
			pMonster:SetIsRight( not pMonster:GetIsRight() )
			pMonster:SetState( "WAIT" )
		end
    else
		pMonster:SetState( "WAIT" )
	end
end

function KaruelBorderDahlia_Phase4_Jump( iMonsterIndex, fTargetX, fTargetY )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	local fGapY = (fTargetY - fMonY)
	if( 0.0 == fGapY ) then
		return false
	end
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = (fGapY / (fGapY / 4.0)) + ((fGapY * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.0105 )
    return true
end