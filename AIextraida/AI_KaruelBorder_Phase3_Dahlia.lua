-- AI_KaruelBorder_Phase3_Dahlia.lua

ActionList =
{
	-- 대기
    {
        ID      = "WAIT",
        Motion  = "Mon_Archer_f_Wait.frm",
        Func    = "KaruelBorderDahlia_Phase3_WaitFunc",

        Trigger =
        {

			-- 타게팅
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_Targeting",
                DelayFrame          = 20,
            },
            -- 타겟지움
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_ReleaseTarget",
                DelayFrame          = 35,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_TurnToTarget",
                DelayFrame          = 15,
            },
            -- 걷기
            {
                AICheckFrame        = 300,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_Walk",
                DelayFrame          = 1100,
            },
            -- 점프업
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- 점프다운
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_JumpDown",
                DelayFrame          = 20,
            },
            -- 도망가기
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_RunAway",
                DelayFrame          = 25,
            },
			-- Attack01
            {
                AICheckFrame        = 25,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_Attack01",
                DelayFrame          = 55,
            },
			-- Attack02
            {
                AICheckFrame        = 15,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_Attack02",
                DelayFrame          = 30,
            },
			-- Attack03
            {
                AICheckFrame        = 55,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_Attack03",
                DelayFrame          = 80,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Mon_Archer_f_Run.frm",
        Func            = "KaruelBorderDahlia_Phase3_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "KaruelBorderDahlia_Phase3_MoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_Targeting",
                DelayFrame          = 40,
            },
            -- 타겟지움
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_ReleaseTarget",
                DelayFrame          = 50,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- 점프업
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- 점프다운
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_JumpDown",
                DelayFrame          = 20,
            },
			-- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_Stop",
                DelayFrame          = 40,
            },
			-- Attack01
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_Attack01",
                DelayFrame          = 55,
            },
        }
    },
    -- 도망가기
    {
        ID      = "RUNAWAY",
        Motion  = "Mon_Archer_f_Run.frm",
        Func    = "KaruelBorderDahlia_Phase3_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "KaruelBorderDahlia_Phase3_MoveFail",


        Trigger =
        {
			-- 회피공격
            {
                AICheckFrame        = 25,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_Attack02",
                DelayFrame          = 75,
            },
             -- 정지
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase3_Check_RunAwayStop",
                DelayFrame          = 10,
            },
        }
    },
    -- Attack01
    {
        ID      = "ATTACK01",
        Motion  = "Mon_Archer_f_Attack03.frm",
        Func    = "KaruelBorderDahlia_Phase3_Attack01Func",
    },
    
    -- ATTACK02_RIGHT
    {
        ID      = "ATTACK02_RIGHT",
        Motion  = "Mon_Archer_f_Attack02_back.frm",
        Func    = "KaruelBorderDahlia_Phase3_Attack02_RightFunc",
    },
	
    -- ATTACK02_LEFT
    {
        ID      = "ATTACK02_LEFT",
        Motion  = "Mon_Archer_f_Attack02.frm",
        Func    = "KaruelBorderDahlia_Phase3_Attack02_LeftFunc",
    },
	
    -- Attack03
    {
        ID      = "ATTACK03",
        Motion  = "Mon_Dahlia_phase3_f_attack03.frm",
        Func    = "KaruelBorderDahlia_Phase3_Attack03Func",
    },

    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Mon_Archer_f_Jump_up.frm",
        Func    = "KaruelBorderDahlia_Phase3_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Mon_Archer_f_Jump_down.frm",
        Func    = "KaruelBorderDahlia_Phase3_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Mon_Archer_f_Jump_landing.frm",
        Func    = "KaruelBorderDahlia_Phase3_ToWait",
    },
    -- 죽기 착지
    {
        ID      = "DIE",
        Motion  = "Mon_Assassin_f_Down_Middle.frm",
        Func    = "KaruelBorderDahlia_Phase3_DieFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "OnKaruelBorderDahlia_Phase3_Land",
    Die     = "OnKaruelBorderDahlia_Phase3_Die",
    Damage  = "OnKaruelBorderDahlia_Phase3_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKaruelBorder_Phase3_Dahlia( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetCountValue( 0 )
	pMonster:SetPushCheck( TRUE )
	
	local vPos = g_MyD3D:Getv3TempValue()
	pMonster:SetX( vPos.x )
	pMonster:SetY( vPos.y )
	
	pMonster:EndBlur()
	pMonster:SetInitAI( true )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function KaruelBorderDahlia_Phase3_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	--pMonster:RenderBox( 0, -750, -100, 750, -600 )
	
	if( pMonster:GetInitAI() ) then
		g_kGlobalValue.bFrameLock = false
		pMonster:PlaySound(986001)
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
function KaruelBorderDahlia_Phase3_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기
function KaruelBorderDahlia_Phase3_DieFunc( iMonsterIndex, iFrame )
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

-- Attack01
function KaruelBorderDahlia_Phase3_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		--pMonster:SetPushCheck(false)
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 50 ) then
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Energy_01", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Energy_02", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Energy_03", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Energy_04", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Energy_05", 0.27, 0.33 )
	elseif( iFrame == 65 ) then
		pMonster:PlaySound(1368)
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK01_1, 0.0, 0.1, true )
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK01_2, 0.0, 0.1, true )
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK01_3, 0.0, 0.1, true )
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK01_4, 0.0, 0.1, true )
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK01_5, 0.0, 0.1, true )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_01_R", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_02_R", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_03", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_04", 0.27, 0.33 )
		else
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK01_1_R, 0.0, 0.1, true )
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK01_2_R, 0.0, 0.1, true )
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK01_3_R, 0.0, 0.1, true )
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK01_4_R, 0.0, 0.1, true )
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK01_5_R, 0.0, 0.1, true )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_01", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_02", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_03", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_04", 0.27, 0.33 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

-- Attack02_Right
function KaruelBorderDahlia_Phase3_Attack02_RightFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetPushCheck(false)
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 35 ) then
		pMonster:PlaySound(1304)
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK02, 0.0, 0.1, true )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_01_R", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_02_R", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_03", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_04", 0.27, 0.33 )
		else
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK02_R, 0.0, 0.1, true )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_01", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_02", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_03", 0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_04", 0.27, 0.33 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck(true)
		pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
    end
end

-- Attack02_Left
function KaruelBorderDahlia_Phase3_Attack02_LeftFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetPushCheck(false)
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 35 ) then
		pMonster:PlaySound(1304)
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK02_R, 0.0, 0.1, true )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_01", -0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_02", -0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_03", -0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_04", -0.27, 0.33 )
		else
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK02, 0.0, 0.1, true )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_01_R", -0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_02_R", -0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_03", -0.27, 0.33 )
			pMonster:AddParticle( "Dun_Karuel1_Dhalia_Shot_04", -0.27, 0.33 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck(true)
		pMonster:SetSuperArmor( false )
		
		if( pMonster:GetIsRight() ) then
			pMonster:SetIsRight( false )
		else
			pMonster:SetIsRight( true )
		end
        pMonster:SetState( "WAIT" )
    end
end

-- Attack03
function KaruelBorderDahlia_Phase3_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 50 ) then
		pMonster:PlaySound(1300)
		pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK03, 0.0, 0.45, true )
	elseif( iFrame == 55 ) then
		pMonster:PlaySound(986019)
		pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_DAHLIA_PHASE3_ATTACK03_BOOM, 0.0, 0.0, true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetInvincible( FALSE )
		pMonster:SetPushCheck( TRUE )
		
		if( pMonster:GetTargetX() < pMonster:GetX() ) then
			if( 0.5 < pMonster:FloatRand() ) then
				pMonster:SetIsRight( true )
			else
				pMonster:SetIsRight( false )
			end
			pMonster:SetState( "ATTACK02_LEFT" )
		else
			if( 0.5 < pMonster:FloatRand() ) then
				pMonster:SetIsRight( true )
			else
				pMonster:SetIsRight( false )
			end
			pMonster:SetState( "ATTACK02_RIGHT" )
		end
    end

end

--  점프 상태
function KaruelBorderDahlia_Phase3_JumpFunc( iMonsterIndex, iFrame )
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
function KaruelBorderDahlia_Phase3_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프에서 웨이트로
function KaruelBorderDahlia_Phase3_ToWait( iMonsterIndex, iFrame )
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

function KaruelBorderDahlia_Phase3_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -630, 800, 630, -850 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function KaruelBorderDahlia_Phase3_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -630, 800, 630, -850 ) == false or pMonster:FloatRand() > 0.5 ) then
		pMonster:ReleaseTarget( true )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase3_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase3_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -200, 360, 200, -400 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase3_Check_RunAway( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -450, 300, 450, -300 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetIsRight( false )
		else
			pMonster:SetIsRight( true )
		end
    
        pMonster:SetState( "RUNAWAY" )
        pMonster:ResetDelay()
    end
end

function KaruelBorderDahlia_Phase3_Check_RunAwayStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -550, 350, 550, -350 ) == false ) then
    	pMonster:SetSpeedX( 0.0 )
    	pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )		
		pMonster:ResetDelay()
    end
end

function KaruelBorderDahlia_Phase3_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, 560, 300, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase3_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 350, -200, 120, 200, -120 ) == true or pMonster:CheckTargetInRange( 800, -400, 400, 400, -400 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase3_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 350, -400, 80, 400, -100 ) == true ) then
		if( pMonster:GetTargetX() < pMonster:GetX() ) then
			if( 0.5 < pMonster:FloatRand() ) then
				pMonster:SetIsRight( true )
			else
				pMonster:SetIsRight( false )
			end
			pMonster:SetState( "ATTACK02_LEFT" )
		else
			if( 0.5 < pMonster:FloatRand() ) then
				pMonster:SetIsRight( true )
			else
				pMonster:SetIsRight( false )
			end
			pMonster:SetState( "ATTACK02_RIGHT" )
		end
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase3_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -400, 80, 400, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase3_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -750, 960, 750, 70 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		KaruelBorderDahlia_Phase3_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase3_Check_JumpDown( iMonsterIndex, iFrame )
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
function OnKaruelBorderDahlia_Phase3_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end
end

function OnKaruelBorderDahlia_Phase3_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	pMonster:SetState( "DIE" )
end

function OnKaruelBorderDahlia_Phase3_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
	if( false == pMonster:GetState( "ATTACK03" ) and
		((pMonster:GetX() + 1.0 > pMonster:GetStageX()) or 
		(pMonster:GetX() - 1.0 < 0.0 )) ) then
		pMonster:SetState( "ATTACK03" )
	end
	
end

function KaruelBorderDahlia_Phase3_MoveFail( iMonsterIndex )
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

function KaruelBorderDahlia_Phase3_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end