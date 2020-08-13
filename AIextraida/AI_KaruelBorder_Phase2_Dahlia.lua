-- AI_KaruelBorder_Phase2_Dahlia.lua

ActionList =
{
	-- 대기
    {
        ID      = "WAIT",
        Motion  = "Mon_Assassin_f_Wait.frm",
        Func    = "KaruelBorderDahlia_Phase2_WaitFunc",

        Trigger =
        {

			-- 타게팅
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_Targeting",
                DelayFrame          = 80,
            },
            -- 타겟지움
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_ReleaseTarget",
                DelayFrame          = 50,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_TurnToTarget",
                DelayFrame          = 15,
            },
            -- 걷기
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_Walk",
                DelayFrame          = 100,
            },
            -- 점프업
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- 점프다운
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_JumpDown",
                DelayFrame          = 20,
            },
			-- Attack01
            {
                AICheckFrame        = 25,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_Attack01",
                DelayFrame          = 90,
            },
			-- Attack02
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_Attack02",
                DelayFrame          = 80,
            },
			-- Attack03
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_Attack03",
                DelayFrame          = 110,
            },
			-- Attack04
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_Attack04",
                DelayFrame          = 150,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Mon_Scout_f_Run.frm",
        Func            = "KaruelBorderDahlia_Phase2_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "KaruelBorderDahlia_Phase2_MoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_Targeting",
                DelayFrame          = 40,
            },
            -- 타겟지움
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_ReleaseTarget",
                DelayFrame          = 50,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- 점프업
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- 점프다운
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_JumpDown",
                DelayFrame          = 20,
            },
			-- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase2_Check_Stop",
                DelayFrame          = 10,
            },
        }
    },

    -- Attack01
    {
        ID      = "ATTACK01",
        Motion  = "Mon_Assassin_f_Attack02.frm",
        Func    = "KaruelBorderDahlia_Phase2_Attack01Func",
    },
    
    -- Attack02
    {
        ID      = "ATTACK02",
        Motion  = "Mon_Assassin_f_Attack01.frm",
        Func    = "KaruelBorderDahlia_Phase2_Attack02Func",
    },
	
    -- Attack03
    {
        ID      = "ATTACK03",
        Motion  = "Mon_Dahlia_phase1_f_attack03.frm",
        Func    = "KaruelBorderDahlia_Phase2_Attack03Func",
    },
    
    -- 그림자 숨기
    {
        ID      = "ATTACK04",
        Motion  = "Mon_Assassin_f_Wait.frm",
        Func    = "KaruelBorderDahlia_Phase2_Attack04Func",
    },
	
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Mon_Scout_f_Jump_up.frm",
        Func    = "KaruelBorderDahlia_Phase2_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Mon_Scout_f_Jump_down.frm",
        Func    = "KaruelBorderDahlia_Phase2_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Mon_Scout_f_Jump_landing.frm",
        Func    = "KaruelBorderDahlia_Phase2_ToWait",
    },
	
    -- 죽기 착지
    {
        ID      = "DIE",
        Motion  = "Mon_Assassin_f_Down_Middle.frm",
        Func    = "KaruelBorderDahlia_Phase2_DieFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "OnKaruelBorderDahlia_Phase2_Land",
    Die     = "OnKaruelBorderDahlia_Phase2_Die",
    Damage  = "OnKaruelBorderDahlia_Phase2_Damage",
	DamageBeforeChange = "OnKaruelBorderDahlia_Phase2_DamageBeforeChange",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKaruelBorder_Phase2_Dahlia( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetCountValue( 0 )
	pMonster:SetPushCheck( true )
	
	local vPos = g_MyD3D:Getv3TempValue()
	pMonster:SetX( vPos.x )
	pMonster:SetY( vPos.y )
	
	pMonster:SetInitAI( true )
	
	pMonster:EndBlur()
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function KaruelBorderDahlia_Phase2_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetInitAI() ) then
		pMonster:PlaySound(986001)
		g_kGlobalValue.bFrameLock = false
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_01", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_02", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_03", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_04", 0.0, 0.1 )
		pMonster:SetInitAI( false )
	end
	
	if( false == pMonster:IsMagicEffect( iMonsterIndex, EGC_EFFECT_KARUELBORDER_ASSASSIN_SHADOW ) ) then
		if( not (-1 == pMonster:GetSelectTexture()) ) then
			pMonster:SetTexture( "" )
		end
		pMonster:ToggleBaseMesh( true )
		pMonster:SetPushCheck( true )
	else
		pMonster:SetPushCheck( false )
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function KaruelBorderDahlia_Phase2_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기
function KaruelBorderDahlia_Phase2_DieFunc( iMonsterIndex, iFrame )
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
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_KARUELBORDER_ASSASSIN_SHADOW )
		pMonster:EndMonster( true, true )
		g_MyD3D:Setv3TempValue( pMonster:GetX(), pMonster:GetY(), 0.0 )
		pMonster:SetFrameLock( true )
    end
end

-- Attack01
function KaruelBorderDahlia_Phase2_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 62 ) then
		local posx = 0.3
		local posy = 0.2
		pMonster:AddParticle("Dun_Karuel1_Dhalia_Slice_01", posx, posy )
		pMonster:AddDamage(DT_KARUELBORDER_DAHLIA_PHASE2_ATTACK01_1)
	elseif( iFrame == 70 ) then
		pMonster:AddDamage(DT_KARUELBORDER_DAHLIA_PHASE2_ATTACK01_2)
		pMonster:PlaySound(992003)
	elseif( iFrame == 82 ) then
		pMonster:AddDamage(DT_KARUELBORDER_DAHLIA_PHASE2_ATTACK01_1)
		pMonster:PlaySound(992003)
	elseif( iFrame == 90 ) then
		pMonster:AddDamage(DT_KARUELBORDER_DAHLIA_PHASE2_ATTACK01_1)
		pMonster:PlaySound(992003)
	elseif( iFrame == 102 ) then
		pMonster:AddDamage(DT_KARUELBORDER_DAHLIA_PHASE2_ATTACK01_1)
		pMonster:PlaySound(992003)
	elseif( iFrame == 108 ) then
		pMonster:AddDamage(DT_KARUELBORDER_DAHLIA_PHASE2_ATTACK01_2)
		pMonster:PlaySound(992003)
	elseif( iFrame == 118 ) then
		pMonster:AddDamage(DT_KARUELBORDER_DAHLIA_PHASE2_ATTACK01_1)
		pMonster:PlaySound(992003)
	elseif( iFrame == 135 ) then
		pMonster:AddDamage(DT_KARUELBORDER_DAHLIA_PHASE2_ATTACK01_3)
		pMonster:PlaySound(992003)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Slice_02", 0.5, 0.2 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Slice_04", 0.5, 0.2 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Slice_05", 0.5, 0.2 )
		else
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Slice_03", -0.5, 0.2 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Slice_04", -0.5, 0.2 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Slice_05", -0.5, 0.2 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

-- Attack02
function KaruelBorderDahlia_Phase2_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_01", 0.15, 0.12 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_02", 0.15, 0.12 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_03", 0.15, 0.12 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_04", 0.15, 0.12 )
		pMonster:PlaySound(992006)
		KaruelBorderDahlia_Phase2_TeleportTarget( iMonsterIndex )
		pMonster:SetY( pMonster:GetTargetY() + 0.1 )
	elseif( iFrame == 25 ) then
		pMonster:AddDamage(DT_KARUELBORDER_DAHLIA_PHASE2_ATTACK02)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Ambush_01", 0.35, 0.18 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Ambush_02", 0.35, 0.18 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Ambush_03", 0.35, 0.18 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Ambush_04", 0.35, 0.18 )
		else
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Ambush_01", -0.35, 0.18 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Ambush_02", -0.35, 0.18 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Ambush_03", -0.35, 0.18 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Ambush_04", -0.35, 0.18 )
		end
		pMonster:PlaySound(992005)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
	
end

-- Attack03
function KaruelBorderDahlia_Phase2_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 90 ) then
		local posx = 0.1
		local posy = 0.6
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Axeslash_Shot_01", posx, posy )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Axeslash_Shot_02", posx, posy )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Axeslash_Shot_03", posx, posy )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Axeslash_Shot_04", posx, posy )
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE2_ATTACK03, 0.0, 0.0, TRUE )
		else
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Axeslash_Shot_01_R", -posx, posy )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Axeslash_Shot_02", -posx, posy )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Axeslash_Shot_03", -posx, posy )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Axeslash_Shot_04", -posx, posy )
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE2_ATTACK03_R, 0.0, 0.0, TRUE )
		end
		pMonster:PlaySound(999062)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end

end

-- Attack04
function KaruelBorderDahlia_Phase2_Attack04Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		if( pMonster:IsOldGraphicQuality() ) then
			pMonster:ToggleBaseMesh( false )
		else
			pMonster:SetTexture( "tex_shadow.dds" )
		end
		
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_01", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_02", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_03", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_04", 0.0, 0.0 )
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_KARUELBORDER_ASSASSIN_SHADOW, 10.0, 1 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState("WAIT")
	end
end

--  점프 상태
function KaruelBorderDahlia_Phase2_JumpFunc( iMonsterIndex, iFrame )
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
function KaruelBorderDahlia_Phase2_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프에서 웨이트로
function KaruelBorderDahlia_Phase2_ToWait( iMonsterIndex, iFrame )
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

function KaruelBorderDahlia_Phase2_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -630, 800, 630, -850 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function KaruelBorderDahlia_Phase2_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -630, 800, 630, -850 ) == false or pMonster:FloatRand() > 0.5 ) then
		pMonster:ReleaseTarget( true )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase2_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase2_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -150, 600, 150, -600 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase2_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -150, 600, 150, -600 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase2_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -150, 50, 130, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase2_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -700, 900, 700, -800 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase2_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -180, 220, 380, -220 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase2_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -330, 450, 330, -450 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase2_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -750, 960, 750, 70 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		KaruelBorderDahlia_Phase2_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase2_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -750, -100, 750, -700 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnKaruelBorderDahlia_Phase2_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end
end

function OnKaruelBorderDahlia_Phase2_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	pMonster:SetState( "DIE" )
end

function OnKaruelBorderDahlia_Phase2_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
end

function OnKaruelBorderDahlia_Phase2_DamageBeforeChange( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsMagicEffect( iMonsterIndex, EGC_EFFECT_KARUELBORDER_ASSASSIN_SHADOW ) ) then
		local iAbsorbHP = pMonster:GetDamageDiff() * 0.5
		pMonster:SetDamageDiff( iAbsorbHP )
	end
end


function KaruelBorderDahlia_Phase2_MoveFail( iMonsterIndex )
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

function SetTargetDamage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local iMaxPlayer = pMonster:GetMaxPlayer()
    for iLoop=0, iMaxPlayer do
		local vPos = pMonster:GetPlayerPos( iLoop )
		if( 0.0 ~= vPos.x or 0.0 ~= vPos.y ) then
			if( pMonster:GetPlayerIsRight( iLoop ) ) then
				pMonster:AddDamageWithStatic(DT_KARUELBORDER_DAHLIA_Phase2_ATTACK03_R, vPos.x - 0.2, vPos.y, 1 )
			else
				pMonster:AddDamageWithStatic(DT_KARUELBORDER_DAHLIA_Phase2_ATTACK03, vPos.x + 0.2, vPos.y, 2 )
			end
		end
    end
	
end


function KaruelBorderDahlia_Phase2_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()

	if( fTargetY - fMonY == 0.0 ) then
		fTargetY = fTargetY + 0.01
	end	
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function KaruelBorderDahlia_Phase2_TeleportTarget( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
	if( pMonster:IsTarget() ) then
		local fDistX = 0.2
		if( pMonster:GetTargetIsRight() and pMonster:GetTargetX() > fDistX ) then
			pMonster:SetX( pMonster:GetTargetX() - fDistX )
			pMonster:SetIsRight( true )
		else
			pMonster:SetX( pMonster:GetTargetX() + fDistX )
			pMonster:SetIsRight( false )
			
			if( pMonster:GetTargetX() > pMonster:GetStageX() - fDistX ) then
				fDistX = fDistX * -1.0
				pMonster:SetIsRight( true )
			end
		end
	end
end
