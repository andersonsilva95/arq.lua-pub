-- AI_Victor.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Victor_Wait.frm",
        Func    = "Victor_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 30,
                AIFunc              = "Victor_Check_Targeting",
                DelayFrame          = 120,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 50,
                AIFunc              = "Victor_Check_TurnToTarget",
                DelayFrame          = 60,
            },

            -- 걷기
            {
                AICheckFrame        = 60,
                AIFunc              = "Victor_Check_Walk",
                DelayFrame          = 90,
            },

            {
                AICheckFrame        = 60,
                AIFunc              = "Victor_Check_Attack01",
                DelayFrame          = 180,
            },

            {
                AICheckFrame        = 100,
                AIFunc              = "Victor_Check_Attack02",
                DelayFrame          = 300,
            },

            {
                AICheckFrame        = 80,
                AIFunc              = "Victor_Check_Attack03",
                DelayFrame          = 240,
            },

            -- 하이점프
			{
				AICheckFrame		= 55,
				AIFunc				= "Victor_Check_JumpUp",
				DelayFrame			= 85,
			},
			-- 점프다운
			{
				AICheckFrame		= 80,
				AIFunc				= "Victor_Check_JumpDown",
				DelayFrame			= 100,
			},

        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Victor_Walk.frm",
        Func    = "Victor_WalkFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 20,
                AIFunc              = "Victor_Check_Targeting",
                DelayFrame          = 100,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "Victor_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- 하이점프
			{
				AICheckFrame		= 55,
				AIFunc				= "Victor_Check_JumpUp",
				DelayFrame			= 75,
			},
			-- 점프다운
			{
				AICheckFrame		= 80,
				AIFunc				= "Victor_Check_JumpDown",
				DelayFrame			= 85,
			},
			-- 근접공격
            {
                AICheckFrame        = 25,
                AIFunc              = "Victor_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "Victor_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- 안구 광선
    {
        ID      = "ATTACK01",
        Motion  = "Victor_Attack01.frm",
        Func    = "Victor_Attack01Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK02",
        Motion  = "Victor_Attack02_Start.frm",
        Func    = "Victor_Attack02Func",
    },
    
    -- 근접공격
    {
        ID      = "ATTACK02_ATK",
        Motion  = "Victor_Attack02_Atk.frm",
        Func    = "Victor_Attack02AtkFunc",
    },
    
    -- 반격
    {
        ID      = "ATTACK03",
        Motion  = "Victor_Attack03.frm",
        Func    = "Victor_Attack03Func",
    },
    
     -- 죽기
    {
        ID      = "REGEN",
        Motion  = "Victor_Next.frm",
        Func    = "Victor_RegenFunc",
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Victor_Next.frm",
        Func    = "Victor_DieFunc",
    },

    -- 다운
    {
        ID                  = "DOWN",
        Motion              = "Victor_Down.frm",
        Func                = "Victor_DamageDownFunc",
    },
    
    -- 점프
	{
		ID	  = "JUMP",
		Motion  = "Victor_Jump.frm",
		Func	= "Victor_JumpFunc",
	},

	-- 착지
	{
		ID	  = "LANDING",
		Motion  = "Victor_Jump_Landing.frm",
		Func	= "Victor_LandingFunc",
	},
}

CallBack =
{
    Land    = "OnVictor_Land",
    Die     = "OnVictor_Die",
    Damage  = "OnVictor_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitVictor( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Victor_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Victor_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
    if( iFrame == 53 ) then
		--pMonster:PlaySound( 998008 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		--pMonster:PlaySound( 998008 )
        pMonster:SetState( "WALK" )
    end
end

-- 점프 상태
function Victor_JumpFuncUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

-- 점프 상태
function Victor_JumpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

-- 점프 상태
function Victor_LandingFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 6 ) then
		--pMonster:PlaySound( 998008 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState("WAIT")
	end
end

-- 죽는상태
function Victor_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		--pMonster:PlaySound(998048)
	elseif( iFrame == pMonster:GetLastFrame() - 1 ) then
		if( pMonster:GetSpecialType() == OPT_GATE ) then
			pMonster:EndMonster()
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        --pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Victor_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 데미지 입은거
function Victor_DamageDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:SetPushCheck( true )
    end
end

--  안구광선
function Victor_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 ) then
		local posX = 0.6
		local posY = 0.35
		if( pMonster:GetIsRight() ) then
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_01", posX,posY)
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_02", posX,posY)
		else
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_01_R", -posX,posY)
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_02_R", -posX,posY)
		end
		pMonster:PlaySound(997001)
		pMonster:AddDamage(DT_VICTOR_ATK1_1)
    elseif( iFrame == 60 ) then
		local posX = 0.4
		local posY = 0.35
		if( pMonster:GetIsRight() ) then
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_01", posX,posY)
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_02", posX,posY)
		else
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_01_R", -posX,posY)
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_02_R", -posX,posY)
		end
		pMonster:PlaySound(997001)
		pMonster:AddDamage(DT_VICTOR_ATK1_2)
    elseif( iFrame == 67 ) then
		local posX = 0.4
		local posY = 0.35
		if( pMonster:GetIsRight() ) then
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_01", posX,posY)
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_02", posX,posY)
		else
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_01_R", -posX,posY)
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_02_R", -posX,posY)
		end
		pMonster:PlaySound(997001)
		pMonster:AddDamage(DT_VICTOR_ATK1_1)
    elseif( iFrame == 75 ) then
		if( pMonster:GetIsRight() ) then
            pMonster:AddParticleNoDirection( "Victor_Combo_Scratch_01", 0.3,0.05)
            pMonster:AddParticleNoDirection( "Victor_Combo_Scratch_02", 0.3,0.05)
		else
            pMonster:AddParticleNoDirection( "Victor_Combo_Scratch_01_R", -0.3,0.05)
            pMonster:AddParticleNoDirection( "Victor_Combo_Scratch_02_R", -0.3,0.05)
		end
    elseif( iFrame == 80 ) then
		pMonster:AddDamage(DT_VICTOR_ATK1_3)
		pMonster:PlaySound(997002)
		local posx = 0.6
        local posy = 0.5
		if( pMonster:GetIsRight() ) then
            pMonster:AddParticleNoDirection( "Victor_Combo_01", posx,posy  )
            pMonster:AddParticleNoDirection( "Victor_Combo_02", posx,posy  )
            pMonster:AddParticleNoDirection( "Victor_Combo_03", posx,posy  )
            pMonster:AddParticleNoDirection( "Victor_Combo_Boom_01", 0.3,0.2)
		else
			pMonster:AddParticleNoDirection( "Victor_Combo_01", -posx,posy  )
            pMonster:AddParticleNoDirection( "Victor_Combo_02_R", -posx,posy  )
            pMonster:AddParticleNoDirection( "Victor_Combo_03_R", -posx,posy  )
            pMonster:AddParticleNoDirection( "Victor_Combo_Boom_01", -0.3,0.2)
		end
	elseif( iFrame == 110 ) then
        pMonster:AddParticleNoDirection( "Victor_Combo_Boom_01", 0.0,0.2)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 근접공격
function Victor_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 15 ) then
        pMonster:SkillReadyEffectNoStop( 150, 20, 150 )
    elseif( iFrame == pMonster:GetLastFrame() - 2 ) then
		local posx = 0.0
        local posy = 0.3
        if( pMonster:GetIsRight() ) then
            pMonster:AddParticleNoDirection( "Victor_Shadow_Dash_01", posx,posy  )
            pMonster:AddParticleNoDirection( "Victor_Shadow_Dash_02", posx,posy  )
		else
			pMonster:AddParticleNoDirection( "Victor_Shadow_Dash_01_R", -posx,posy  )
            pMonster:AddParticleNoDirection( "Victor_Shadow_Dash_02_R", -posx,posy  )
		end
    elseif( iFrame == pMonster:GetLastFrame() ) then
		fDistX = 0.7
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
        pMonster:SetState( "ATTACK02_ATK" )
    end
end

-- 근접공격
function Victor_Attack02AtkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 5 ) then
		local posX = 0.6
		local posY = 0.35
		if( pMonster:GetIsRight() ) then
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_01", posX,posY)
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_02", posX,posY)
		else
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_01_R", -posX,posY)
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_02_R", -posX,posY)
		end
		pMonster:PlaySound(997001)
		pMonster:AddDamage(DT_VICTOR_ATK2_1)
	elseif( iFrame == 15 ) then
		local posX = 0.45
		local posY = 0.35
		if( pMonster:GetIsRight() ) then
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_01", posX,posY)
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_02", posX,posY)
		else
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_01_R", -posX,posY)
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_02_R", -posX,posY)
		end
		pMonster:PlaySound(997001)
		pMonster:AddDamage(DT_VICTOR_ATK2_1)
	elseif( iFrame == 20 ) then
		local posX = 0.45
		local posY = 0.35
		if( pMonster:GetIsRight() ) then
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_01", posX,posY)
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_02", posX,posY)
		else
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_01_R", -posX,posY)
            pMonster:AddParticleNoDirection( "Victor_Combo_Normal_02_R", -posX,posY)
		end
		pMonster:PlaySound(997001)
		pMonster:AddDamage(DT_VICTOR_ATK2_1)
	elseif( iFrame == 35 ) then
		pMonster:PlaySound(997002)
		pMonster:AddDamage(DT_VICTOR_ATK2_2)
		local posx = 0.4
        local posy = 0.3
        if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection( "Victor_Shadow_Punch_01", posx,posy  )
		pMonster:AddParticleNoDirection( "Victor_Shadow_Punch_02", posx,posy  )
		pMonster:AddParticleNoDirection( "Victor_Shadow_Punch_03", posx,posy  )
		pMonster:AddParticleNoDirection( "Victor_Shadow_Punch_04", posx,posy  )
		pMonster:AddParticleNoDirection( "Victor_Shadow_Punch_05", posx,posy  )
		pMonster:AddParticleNoDirection( "Victor_Shadow_Punch_06", posx,posy  )
		pMonster:AddParticleNoDirection( "Victor_Shadow_Punch_07", posx,posy  )
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  반격 손바닥 짝
function Victor_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    local angle
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 30 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Victor_Combo_Boom_01", 0.15,0.2)
		else
			pMonster:AddParticleNoDirection( "Victor_Combo_Boom_01", -0.15,0.2)
		end
    elseif( iFrame == 75 ) then
		pMonster:PlaySound(997003)
		pMonster:ComputeAngleToTarget( 0.3, 0.27 ) -- 타겟으로의 각도를 계산
		angle = pMonster:GetAngleToTarget()
		if( ( pMonster:GetX() > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
		    ( pMonster:GetX() < pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
			angle = angle * -1.0 + 3.141592
		end
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02", 0.2,0.4)
		else
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, -angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02_R", -0.2,0.4)
		end
	elseif( iFrame == 87 ) then
		pMonster:PlaySound(997003)
		pMonster:ComputeAngleToTarget( 0.3, 0.27 ) -- 타겟으로의 각도를 계산
		angle = pMonster:GetAngleToTarget()
		if( ( pMonster:GetX() > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
		    ( pMonster:GetX() < pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
			angle = angle * -1.0 + 3.141592
		end
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02", 0.2,0.4)
		else
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, -angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02_R", -0.2,0.4)
		end
	elseif( iFrame == 103 ) then
		pMonster:PlaySound(997003)
		pMonster:ComputeAngleToTarget( 0.3, 0.27 ) -- 타겟으로의 각도를 계산
		angle = pMonster:GetAngleToTarget()
		if( ( pMonster:GetX() > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
		    ( pMonster:GetX() < pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
			angle = angle * -1.0 + 3.141592
		end
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02", 0.2,0.4)
		else
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, -angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02_R", -0.2,0.4)
		end
	elseif( iFrame == 116 ) then
		pMonster:PlaySound(997003)
		pMonster:ComputeAngleToTarget( 0.3, 0.27 ) -- 타겟으로의 각도를 계산
		angle = pMonster:GetAngleToTarget()
		if( ( pMonster:GetX() > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
		    ( pMonster:GetX() < pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
			angle = angle * -1.0 + 3.141592
		end
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02", 0.2,0.4)
		else
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, -angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02_R", -0.2,0.4)
		end
   	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 피채우고 ~ phase2로 가쟈!
function Victor_RegenFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= 40 and iFrame < pMonster:GetLastFrame() ) then
		pMonster:SetHP( pMonster:GetHP() + pMonster:GetMaxHP() * 0.05 )
	end
	
	if( iFrame == 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 30 ) then
		local posX = 0.0
        local posY = 0.3
		pMonster:AddParticleNoDirection( "Victor_Change_01", posX,posY)
		pMonster:AddParticleNoDirection( "Victor_Change_02", posX,posY)
		pMonster:AddParticleNoDirection( "Victor_Change_03", posX,posY)
		pMonster:AddParticleNoDirection( "Victor_Change_04", posX,posY)
	elseif( iFrame == 60 ) then
		pMonster:AddParticleNoDirection( "Victor_Res_01", 0.0, 0.3)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
        pMonster:SetHP( pMonster:GetHP() + pMonster:GetMaxHP() * 0.05 )
    end
end
-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Victor_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 400, -900, 500, 900, -400 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Victor_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Victor_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Victor_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Victor_Check_JumpUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 300, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Victor_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

function Victor_Check_JumpDown( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

   if( pMonster:CheckTargetInRange( 30, -400, -40, 400, -1000 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetSpeedY( 0.01 )			
		pMonster:SetState( "JUMP" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

function Victor_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 180, -180, 200, 180, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Victor_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetTargetIsContact() and pMonster:CheckTargetInRange( 0, -1536, 500, 1536, -500 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
		pMonster:SetSuperArmor(true)
    end
end

function Victor_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 400, -400, 500, 400, -400 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnVictor_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "LANDING" )
    end
	
	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE" )
	end
end

function OnVictor_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:TurnToTarget()
	pMonster:SetState( "DIE" )
end

function OnVictor_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	   
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	if ( pMonster:FloatRand() < 0.05 and pMonster:IsSuperArmor() == false and pMonster:CheckState("DOWN") == false ) then
        pMonster:SetSuperArmor(true)
		pMonster:TurnToTarget()
		if ( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK02" )
		else
			pMonster:SetState( "ATTACK03" )
		end
	end
end

function Victor_Jump( iMonsterIndex )
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