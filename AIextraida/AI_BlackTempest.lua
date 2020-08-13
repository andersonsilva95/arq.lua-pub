-- AI_BlackTempest.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "BlackTempest_Wait.frm",
        Func    = "BlackTempest_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackTempest_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 60,
                AIFunc              = "BlackTempest_Check_TurnToTarget",
                DelayFrame          = 55,
            },

            -- 걷기
            {
                AICheckFrame        = 90,
                AIFunc              = "BlackTempest_Check_Walk",
                DelayFrame          = 100,
            },

            -- 하이점프
			{
				AICheckFrame		= 61,
				AIFunc				= "BlackTempest_Check_JumpUp",
				DelayFrame			= 120,
			},

			-- 점프다운
			{
				AICheckFrame		= 62,
				AIFunc				= "BlackTempest_Check_JumpDown",
				DelayFrame			= 120,
			},

			-- X Slash
            {
                AICheckFrame        = 30,
                AIFunc              = "BlackTempest_Check_Attack01",
                DelayFrame          = 210,
            },

            -- 근접공격
            {
                AICheckFrame        = 40,
                AIFunc              = "BlackTempest_Check_Attack02",
                DelayFrame          = 360,
            },

            -- 반격
            {
                AICheckFrame        = 80,
                AIFunc              = "BlackTempest_Check_Attack03",
                DelayFrame          = 400,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "BlackTempest_Move.frm",
        Func    = "BlackTempest_WalkFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "BlackTempest_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackTempest_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 하이점프
			{
				AICheckFrame		= 55,
				AIFunc				= "BlackTempest_Check_JumpUp",
				DelayFrame			= 75,
			},
			-- 점프다운
			{
				AICheckFrame		= 60,
				AIFunc				= "BlackTempest_Check_JumpDown",
				DelayFrame			= 85,
			},
			-- 근접공격
            {
                AICheckFrame        = 20,
                AIFunc              = "BlackTempest_Check_Attack02",
                DelayFrame          = 400,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "BlackTempest_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- 안구 광선
    {
        ID      = "ATTACK01",
        Motion  = "BlackTempest_Attack01.frm",
        Func    = "BlackTempest_Attack01Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK02",
        Motion  = "BlackTempest_Attack02.frm",
        Func    = "BlackTempest_Attack02Func",
    },
    
    -- 반격
    {
        ID      = "ATTACK03",
        Motion  = "BlackTempest_Attack03.frm",
        Func    = "BlackTempest_Attack03Func",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "BlackTempest_Die.frm",
        Func    = "BlackTempest_DieFunc",
    },
    
    -- 점프
	{
		ID	  = "JUMP",
		Motion  = "BlackTempest_Jump_up.frm",
		Func	= "BlackTempest_JumpFuncUp",
	},

	-- 점프다운
	{
		ID	  = "JUMPDOWN",
		Motion  = "BlackTempest_Jump_Down.frm",
		Func	= "BlackTempest_JumpFunc",
	},

	-- 착지
	{
		ID	  = "LANDING",
		Motion  = "BlackTempest_Jump_Landing.frm",
		Func	= "BlackTempest_LandingFunc",
	},
}

CallBack =
{
    Land    = "OnBlackTempest_Land",
    Die     = "OnBlackTempest_Die",
    Damage  = "OnBlackTempest_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitBlackTempest( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	-- 8 머리
	-- 2 허리
	-- 21, 13 관절
	pMonster:AddTraceParticleToBone( "Black_Tempest_Head_01", 1.0, 8, 9, 6, 0.0, 0.05 )
	pMonster:AddTraceParticleToBone( "Black_Tempest_Head_02", 1.0, 8, 8, 5, 0.0, 0.05 )
	pMonster:AddTraceParticleToBone( "Black_Tempest_Leg_01", 1.0, 2, 9, 6, 0.0, -0.1 )
	pMonster:AddTraceParticleToBone( "Black_Tempest_Leg_02", 1.0, 2, 8, 5, 0.0, -0.1 )
	pMonster:AddTraceParticleToBone( "Black_Tempest_Articulation_01", 1.0, 21, 8, 5, 0.0, 0.05 )
	pMonster:AddTraceParticleToBone( "Black_Tempest_Articulation_02", 1.0, 21, 8, 5, 0.0, 0.05 )
	pMonster:AddTraceParticleToBone( "Black_Tempest_Articulation_01", 1.0, 13, 8, 5, 0.0, 0.05 )
	pMonster:AddTraceParticleToBone( "Black_Tempest_Articulation_02", 1.0, 13, 8, 5, 0.0, 0.05 )
	pMonster:AddTraceParticleToBone( "Black_Tempest_Articulation_01", 1.0, 2, 9, 6, 0.0, 0.1 )
	pMonster:AddTraceParticleToBone( "Black_Tempest_Articulation_02", 1.0, 2, 8, 5, 0.0, 0.1 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function BlackTempest_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function BlackTempest_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
    if( iFrame == 53 ) then
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 점프 상태
function BlackTempest_JumpFuncUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMPDOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

-- 점프 상태
function BlackTempest_JumpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

-- 점프 상태
function BlackTempest_LandingFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 6 ) then
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState("WAIT")
	end
end

-- 죽는상태
function BlackTempest_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(997010)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

-- 데미지 입은거
function BlackTempest_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 데미지 입은거
function BlackTempest_DamageDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:SetPushCheck( true )
    end
end

--  X Slash
function BlackTempest_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 59 ) then
		local posx = 0.33
        local posy = 0.35
		if( pMonster:GetIsRight() ) then
            pMonster:AddParticleNoDirection( "Blacktempest_Xslash_01", posx,posy  )
		else
			pMonster:AddParticleNoDirection( "Blacktempest_Xslash_01_R", -posx,posy  )
		end
		pMonster:AddDamage(DT_BLACKTEMPEST_ATK1_1)
		pMonster:PlaySound(997007)
	elseif( iFrame == 81 ) then
		local posx = 0.35
        local posy = 0.30
		if( pMonster:GetIsRight() ) then
            pMonster:AddParticleNoDirection( "Blacktempest_Xslash_02", 0.33, 0.30  )
		else
            pMonster:AddParticleNoDirection( "Blacktempest_Xslash_02_R", -0.33, 0.35  )
		end
		pMonster:AddDamage(DT_BLACKTEMPEST_ATK1_2)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 근접공격
function BlackTempest_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 60 ) then
		pMonster:PlaySound(997008)
		pMonster:AddDamage(DT_BLACKTEMPEST_ATK2)
		local posx = 1.44
        local posy = 0.325
		if( pMonster:GetIsRight() ) then
            pMonster:AddParticleNoDirection( "Black_Tempest_Lance_01", posx,posy  )
            pMonster:AddParticleNoDirection( "Black_Tempest_Lance_02", posx,posy  )
            pMonster:AddParticleNoDirection( "Black_Tempest_Lance_03", posx,posy  )
            pMonster:AddParticleNoDirection( "Black_Tempest_Lance_04", posx,posy  )
		else
			pMonster:AddParticleNoDirection( "Black_Tempest_Lance_01_R", -posx,posy  )
            pMonster:AddParticleNoDirection( "Black_Tempest_Lance_02_R", -posx,posy  )
            pMonster:AddParticleNoDirection( "Black_Tempest_Lance_03_R", -posx,posy  )
            pMonster:AddParticleNoDirection( "Black_Tempest_Lance_04_R", -posx,posy  )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  반격 손바닥 짝
function BlackTempest_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 80 ) then
		pMonster:PlaySound(997009)
		pMonster:AddDamage(DT_BLACKTEMPEST_ATK3)
		local posx = 0.0
        local posy = 0.33
        pMonster:AddParticleNoDirection( "Black_Tempest_Boom_01", posx,posy  )
        pMonster:AddParticleNoDirection( "Black_Tempest_Boom_02", posx,posy  )
        pMonster:AddParticleNoDirection( "Black_Tempest_Boom_03", posx,posy  )
        pMonster:AddParticleNoDirection( "Black_Tempest_Boom_04", posx,posy  )
        pMonster:AddParticleNoDirection( "Black_Tempest_Boom_05", posx,posy  )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function BlackTempest_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 260, 400, -250 ) == true ) then
        pMonster:ResetDelay()
    end
end

function BlackTempest_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function BlackTempest_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -300, 350, 300, -250 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function BlackTempest_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -450 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function BlackTempest_Check_JumpUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 300, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		BlackTempest_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

function BlackTempest_Check_JumpDown( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

   if( pMonster:CheckTargetInRange( 300, -300, -100, 300, -500 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetSpeedY( 0.01 )			
		pMonster:SetState( "JUMPDOWN" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

function BlackTempest_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 220, -200, 200, 200, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function BlackTempest_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 444, -250, 170, 250, -90 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
		pMonster:SetSuperArmor(true)
    end
end

function BlackTempest_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -250, 220, 250, -80 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnBlackTempest_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPDOWN" ) == true ) then
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "LANDING" )
    end
	
	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE" )
	end
end

function OnBlackTempest_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:TurnToTarget()
	pMonster:SetState( "DIE" )
end

function OnBlackTempest_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )

    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	if ( pMonster:FloatRand() < 0.02 and pMonster:IsSuperArmor() == false ) then	
		pMonster:SetSuperArmor(true)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
	end
end

function BlackTempest_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.8) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:SetIgnoreFHCheck(true)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end