-- AI_KaruelBorder_Phase1_Dahlia.lua

ActionList =
{
	-- 대기
    {
        ID      = "WAIT",
        Motion  = "Mon_Scout_f_Wait.frm",
        Func    = "KaruelBorderDahlia_Phase1_WaitFunc",

        Trigger =
        {

			-- 타게팅
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_Targeting",
                DelayFrame          = 80,
            },
            -- 타겟지움
            {
                AICheckFrame        = 55,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_ReleaseTarget",
                DelayFrame          = 50,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_TurnToTarget",
                DelayFrame          = 15,
            },
            -- 걷기
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_Walk",
                DelayFrame          = 110,
            },
            -- 텔레포트(업)
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_TeleportUp",
                DelayFrame          = 30,
            },        
            -- 텔레포트(다운)
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_TeleportDown",
                DelayFrame          = 20,
            },
			-- Attack01
            {
                AICheckFrame        = 25,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_Attack01",
                DelayFrame          = 55,
            },
			-- Attack02
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_Attack02",
                DelayFrame          = 80,
            },
			-- Attack03
            {
                AICheckFrame        = 55,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_Attack03",
                DelayFrame          = 110,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Mon_Scout_f_Run.frm",
        Func            = "KaruelBorderDahlia_Phase1_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "KaruelBorderDahlia_Phase1_MoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_Targeting",
                DelayFrame          = 40,
            },
            -- 타겟지움
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_ReleaseTarget",
                DelayFrame          = 50,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- 점프업(텔레포트)
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_TeleportUp",
                DelayFrame          = 30,
            },        
            -- 점프다운(텔레포트)
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_TeleportDown",
                DelayFrame          = 20,
            },
			-- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_Stop",
                DelayFrame          = 40,
            },
			-- Attack01
            {
                AICheckFrame        = 15,
                AIFunc              = "KaruelBorderDahlia_Phase1_Check_Attack01",
                DelayFrame          = 30,
            },
        }
    },

    -- Attack01
    {
        ID      = "ATTACK01",
        Motion  = "Mon_Scout_f_Attack03.frm",
        Func    = "KaruelBorderDahlia_Phase1_Attack01Func",
    },
    
    -- Attack02
    {
        ID      = "ATTACK02",
        Motion  = "Mon_Scout_f_Attack01.frm",
        Func    = "KaruelBorderDahlia_Phase1_Attack02Func",
    },
	
    -- Attack03
    {
        ID      = "ATTACK03",
        Motion  = "Mon_Scout_f_Attack01.frm",
        Func    = "KaruelBorderDahlia_Phase1_Attack03Func",
    },
	
    -- 텔레포트
    {
        ID      = "TELEPORT",
        Motion  = "Mon_Scout_f_Wait.frm",
        Func    = "KaruelBorderDahlia_Phase1_TeleportFunc",
    },

    -- 죽기 착지
    {
        ID      = "DIE",
        Motion  = "Mon_Scout_f_Wait.frm",
        Func    = "KaruelBorderDahlia_Phase1_DieFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "OnKaruelBorderDahlia_Phase1_Land",
    Die     = "OnKaruelBorderDahlia_Phase1_Die",
    Damage  = "OnKaruelBorderDahlia_Phase1_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitKaruelBorder_Phase1_Dahlia( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetCountValue( 0 )
	pMonster:SetPushCheck( TRUE )
	
	local vPos = g_MyD3D:Getv3TempValue()
	pMonster:SetX( 1.8 )
	pMonster:SetY( 1.8 )
	
	--pMonster:SetMapTempValue( "PARTICLE_CHEK", 0 )
	pMonster:EndBlur()
	pMonster:SetInitAI( true )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function KaruelBorderDahlia_Phase1_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:ToggleRender( TRUE )
	
	--pMonster:RenderBox(0, -750, -100, 750, -700 )
	
	if( pMonster:GetInitAI() ) then
		--g_kCamera.WideMode = 8 
		pMonster:SetInitAI( false )
	end
	
	if( iFrame == 8 ) then
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_01", 0.0, 0.1 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_02", 0.0, 0.1 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_03", 0.0, 0.1 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_04", 0.0, 0.1 )
			pMonster:PlaySound(992006)
			--pMonster:SetMapTempValue( "PARTICLE_CHEK", 0 )
	end
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function KaruelBorderDahlia_Phase1_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기
function KaruelBorderDahlia_Phase1_DieFunc( iMonsterIndex, iFrame )
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
function KaruelBorderDahlia_Phase1_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 55 ) then
		pMonster:PlaySound(992002)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Cross_01", 0.3, 0.3 )
		else
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Cross_01", -0.3, 0.3 )
		end

		pMonster:AddDamage( DT_KARUELBORDER_DAHLIA_PHASE1_ATTACK01_1 )
	elseif( iFrame == 67 ) then
		pMonster:PlaySound(992002)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Cross_02", 0.4, 0.3 )
		else
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Cross_02", -0.4, 0.3 )
		end

		pMonster:AddDamage( DT_KARUELBORDER_DAHLIA_PHASE1_ATTACK01_2 )
	elseif( iFrame == 88 ) then
		pMonster:PlaySound(992002)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Cross_03", 0.4, 0.3 )
		else
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Cross_03", -0.4, 0.3 )
		end
		
		pMonster:AddDamage( DT_KARUELBORDER_DAHLIA_PHASE1_ATTACK01_3 )
	elseif( iFrame == 110 ) then
		pMonster:PlaySound(992002)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Cross_04", 0.4, 0.3 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Cross_05", 0.4, 0.3 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Cross_06", 0.4, 0.3 )
		else
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Cross_04", -0.4, 0.3 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Cross_05", -0.4, 0.3 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Cross_06", -0.4, 0.3 )
		end

		pMonster:AddDamage( DT_KARUELBORDER_DAHLIA_PHASE1_ATTACK01_4 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

-- Attack02
function KaruelBorderDahlia_Phase1_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 54 ) then
		local posx = 0.15
		local posy = 0.12
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_01", posx, posy )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_02", posx, posy )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_03", posx, posy )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_04", posx, posy )
		pMonster:PlaySound(992006)
	elseif( iFrame == 55 ) then
		fDistX = 0.2
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
		pMonster:SetY( pMonster:GetTargetY() )
	elseif( iFrame == 65 ) then
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_01", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_02", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_03", 0.0, 0.1 )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_04", 0.0, 0.1 )
		pMonster:PlaySound(992006)
	elseif( iFrame == 85 ) then
		local posx = 0.18
		local posy = 0.18
		pMonster:AddDamage(DT_KARUELBORDER_DAHLIA_PHASE1_ATTACK02)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Blackwood_Assassin_Scratch", posx, posy )
		else
			pMonster:AddParticleNoDirection( "Blackwood_Assassin_Scratch_R", -posx, posy )
		end
		pMonster:PlaySound(992005)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
	
end

-- Attack03
function KaruelBorderDahlia_Phase1_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 54 ) then
		local posx = 0.15
		local posy = 0.12
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_01", posx, posy )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_02", posx, posy )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_03", posx, posy )
		pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_04", posx, posy )
		pMonster:PlaySound(992006)
	elseif( iFrame == 55 ) then		
		pMonster:ToggleRender( FALSE )
	elseif( iFrame == 60 ) then
		if( pMonster:GetIsRight() == false ) then
			pMonster:AddDamage( DT_KARUELBORDER_DAHLIA_PHASE1_ATTACK03 )
		else
			pMonster:AddDamage( DT_KARUELBORDER_DAHLIA_PHASE1_ATTACK03_R )
		end
		pMonster:PlaySound(992005)
	elseif( iFrame == 90 ) then
		if( pMonster:GetIsRight() == false ) then
			pMonster:AddDamage( DT_KARUELBORDER_DAHLIA_PHASE1_ATTACK03_1 )
		else
			pMonster:AddDamage( DT_KARUELBORDER_DAHLIA_PHASE1_ATTACK03_1_R )
		end	
		pMonster:PlaySound(992005)
	elseif( iFrame == 110 ) then
		if( pMonster:GetIsRight() == false ) then
			pMonster:AddDamage( DT_KARUELBORDER_DAHLIA_PHASE1_ATTACK03_2 )
		else
			pMonster:AddDamage( DT_KARUELBORDER_DAHLIA_PHASE1_ATTACK03_2_R )
		end
		pMonster:PlaySound(992005)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:ToggleRender( TRUE )
		pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end

end

--  점프 상태
function KaruelBorderDahlia_Phase1_TeleportFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( false == pMonster:IsTarget() ) then
		pMonster:SetState( "WAIT" )
	end

	if( iFrame <= 1 ) then
			--pMonster:SetMapTempValue( "PARTICLE_CHEK", 1 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_01", 0.0, 0.0 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_02", 0.0, 0.0 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_03", 0.0, 0.0 )
			pMonster:AddParticleNoDirection( "Dun_Karuel1_Dhalia_Hide_04", 0.0, 0.0 )
			pMonster:PlaySound(992006)
			pMonster:ToggleRender( FALSE )
		fDistX = 0.2
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
		
		pMonster:SetY( pMonster:GetTargetY() )
		pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function KaruelBorderDahlia_Phase1_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -630, 800, 630, -850 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function KaruelBorderDahlia_Phase1_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -630, 800, 630, -850 ) == false or pMonster:FloatRand() > 0.5 ) then
		pMonster:ReleaseTarget( true )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase1_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase1_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -100, 360, 100, -400 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase1_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -100, 360, 100, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase1_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -130, 50, 130, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase1_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -400, 350, 400, -350 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase1_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -400, 350, 400, -350 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase1_Check_TeleportUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -650, 960, 650, 70 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetState( "TELEPORT" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderDahlia_Phase1_Check_TeleportDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -750, -100, 750, -700 ) == true ) then
		pMonster:SetState( "TELEPORT" )
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnKaruelBorderDahlia_Phase1_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
end

function OnKaruelBorderDahlia_Phase1_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	pMonster:SetState( "DIE" )
end

function OnKaruelBorderDahlia_Phase1_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
end

function KaruelBorderDahlia_Phase1_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then
		if( pMonster:IsTarget() ) then
			if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
				pMonster:SetState( "TELEPORT" )
			else
				pMonster:SetState( "TELEPORT" )
			end
		else
			pMonster:SetIsRight( not pMonster:GetIsRight() )
			pMonster:SetState( "WAIT" )
		end
	else
		pMonster:SetState( "WAIT" )
	end
end