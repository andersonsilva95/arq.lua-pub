-- AI_Sentrykiper02.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Sentrykiper02_Wait.frm",
        Func    = "Sentrykiper02_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Sentrykiper02_Check_Targeting",
                DelayFrame          = 40,
            },

            -- 타겟지움
            --{
            --	AICheckFrame        = 300,
            --	AIFunc              = "Sentrykiper02_Check_ReleaseTarget",
            --	DelayFrame          = 100,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "Sentrykiper02_Check_TurnToTarget",
                DelayFrame          = 5,
            },

            -- 걷기
            {
                AICheckFrame        = 30,
                AIFunc              = "Sentrykiper02_Check_Walk",
                DelayFrame          = 20,
            },

            -- 점프업
            {
                AICheckFrame        = 31,
                AIFunc              = "Sentrykiper02_Check_JumpUp",
                DelayFrame          = 150,
				DelayFrame1         = 100,
				DelayFrame2         = 50,
				DelayFrame3         = 50,
            },        

            -- 점프다운
            {
                AICheckFrame        = 32,
                AIFunc              = "Sentrykiper02_Check_JumpDown",
                DelayFrame          = 30,
            },

			-- 마그네틱 스피어
            {
                AICheckFrame        = 22,
                AIFunc              = "Sentrykiper02_Check_Attack01",
                DelayFrame          = 444,
				DelayFrame1         = 333,
				DelayFrame2         = 222,
				DelayFrame3         = 222,
            },

            -- 체인 쏘우
            {
                AICheckFrame        = 50,
                AIFunc              = "Sentrykiper02_Check_Attack02",
                DelayFrame          = 300,
				DelayFrame1         = 240,
				DelayFrame2         = 190,
				DelayFrame3         = 190,
            },

			-- 체인 쏘우 콤보
            {
                AICheckFrame        = 1,
                AIFunc              = "Sentrykiper02_Check_Attack02_Combo",
                DelayFrame          = 50,
            },

            -- 제네시스 파이어 [75%]
            {
                AICheckFrame        = 200,
                AIFunc              = "Sentrykiper02_Check_Attack03",
                DelayFrame          = 1000,
				DelayFrame1         = 600,
				DelayFrame2         = 400,
				DelayFrame3         = 400,
            },

		},
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Sentrykiper02_move.frm",
        Func            = "Sentrykiper02_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Sentrykiper02_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 20,
                AIFunc              = "Sentrykiper02_Check_Targeting",
                DelayFrame          = 40,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "Sentrykiper02_Check_TurnToTarget",
                DelayFrame          = 5,
            },
            -- 점프업
            {
                AICheckFrame        = 31,
                AIFunc              = "Sentrykiper02_Check_JumpUp",
                DelayFrame          = 50,
            },        
            -- 점프다운
            {
                AICheckFrame        = 32,
                AIFunc              = "Sentrykiper02_Check_JumpDown",
                DelayFrame          = 30,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "Sentrykiper02_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Sentrykiper02_Attack01.frm",
        Func    = "Sentrykiper02_Attack01Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02",
        Motion  = "Sentrykiper02_Attack02.frm",
        Func    = "Sentrykiper02_Attack02Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK03",
        Motion  = "Sentrykiper02_Attack03.frm",
        Func    = "Sentrykiper02_Attack03Func",
    },
    
    -- 오버 드라이브
    {
        ID      = "BUFF",
        Motion  = "Sentrykiper02_Buff.frm",
        Func    = "Sentrykiper02_Attack04Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Sentrykiper02_Jump_Up.frm",
        Func    = "Sentrykiper02_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Sentrykiper02_Jump_Down.frm",
        Func    = "Sentrykiper02_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Sentrykiper02_Jump_Landing.frm",
        Func    = "Sentrykiper02_ToWait",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Sentrykiper02_Die.frm",
        Func    = "Sentrykiper02_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "OnSentrykiper02_Land",
    Die     = "OnSentrykiper02_Die",
    Damage  = "OnSentrykiper02_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitSentrykiper02( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:AddTraceParticleToBone( "Shovel_Steam", 1.0, 0, 8, 8, 0.0, 0.0, true )
    pMonster:AddTraceParticleToBone( "Shovel_Steam", 1.0, 9, 8, 8, 0.0, 0.0, true )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Sentrykiper02_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper02_Smoke(iMonsterIndex, iFrame)
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Sentrykiper02_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    Sentrykiper02_Smoke(iMonsterIndex, iFrame)

	if( (iFrame >= 10 and iFrame <= 15) or (iFrame >= 40 and iFrame <= 45) ) then
		pMonster:SetSpeedX(0)
		if( iFrame == 10 or iFrame == 40 ) then
			pMonster:PlaySound(989002)
		end
	else
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	end
		
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기 착지
function Sentrykiper02_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 0 ) -- 1호기

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(989001)
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_OVERDRIVE)
	elseif( iFrame == pMonster:GetLastFrame() - 5 ) then
		if( pMon:GetHP() > 0 and false == pMon:IsMagicEffect( 0, EGC_EFFECT_OVERDRIVE ) ) then
			pMon:SetState("BUFF")
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Sentrykiper02_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper02_Smoke(iMonsterIndex, iFrame)

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Sentrykiper02_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper02_Smoke(iMonsterIndex, iFrame)
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 5 ) then
		local posx = 0.15
		local posy = -0.02
		
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "SK2_Magnetic_Shot_02", 1.0, 22, 8, 8, posx, posy, true )
		else
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "SK2_Magnetic_Shot_02_R", 1.0, 22, 8, 8, posx, posy, true )
		end
		pMonster:AddTraceParticleToBone( "SK2_Magnetic_Shot_01", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Magnetic_Shot_03", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Magnetic_Shot_04", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Magnetic_Shot_05", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:PlaySound(989006)
    elseif( iFrame == 37 ) then
		pMonster:ComputeAngleToTarget( 0.25, 0.18, -60, 60 ) -- 타겟으로의 각도를 계산
        angle = pMonster:GetAngleToTarget()
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
        end
        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK1, 0.25, 0.36, false, angle )
		pMonster:AddDamageWithLocate( DT_SENTRYKEEPER2_ATK1_DESTINATION, pMonster:GetTargetX(), pMonster:GetTargetY(), true )
		pMonster:AddParticle( "SK_Scratch", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function Sentrykiper02_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper02_Smoke(iMonsterIndex, iFrame)
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 21 ) then
		pMonster:PlaySound(989007)
		pMonster:AddTraceParticleToBone( "SK1_Saw_Dust", 1.0, 13, 8, 8, posx, posy, true )
	elseif( iFrame == 57 ) then
		pMonster:AddDamage(DT_SENTRYKEEPER2_ATK2)
		--pMonster:StartAttack( 2, PAR_FRONTDOWN_DROPDAMAGE_3, 0.3, 14, 15, 48 )
		pMonster:SetDrawSlash( 0 , true )
		pMonster:PlaySound(989008)
		local posx = 0.7
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "SK_Scratch_R",posx, posy )
		else
			pMonster:AddParticleNoDirection( "SK_Scratch",  -posx, posy )
		end
	--elseif( iFrame >= 82 and iFrame < 106 ) then
	--	if( math.mod(iFrame, 8) ) then
	--		pMonster:StartAttack( 2, PAR_BIG_DAMAGE, 0.4, 14, 15, 48 )
	--	end
	elseif( iFrame == 82 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "SK1_Saw", 1.0, 15, 8, 8, posx, posy, true )
		else
			pMonster:AddTraceParticleToBone( "SK1_Saw_R", 1.0, 15, 8, 8, posx, posy, true )
		end
		pMonster:AddTraceParticleToBone( "SK1_Saw_Dust", 1.0, 13, 8, 8, posx, posy, true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function Sentrykiper02_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper02_Smoke(iMonsterIndex, iFrame)

	local angle = 0.0
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 44 ) then
		pMonster:PlaySound(989033)
		local posx = 0.61
		local posy = 0.51
		if( false ==pMonster:GetIsRight() ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection( "SK2_Fire_Charge_01",  posx, posy )
		pMonster:AddParticleNoDirection( "SK2_Fire_Charge_02",  posx, posy )
		pMonster:AddParticleNoDirection( "SK2_Fire_Charge_03",  posx, posy )
		pMonster:AddParticleNoDirection( "SK2_Fire_Charge_04",  posx, posy )
	elseif( iFrame == 46 ) then
		pMonster:SkillReadyEffect(255, 128, 128, 0.5)
	elseif( iFrame == 66 ) then
		angle = 0.0
		if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		end

        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK3, 0.4, 0.56, false, angle )
        pMonster:AddTraceParticleToBone( "SK2_Fire_Handtip", 0.05, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_01", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_02", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:PlaySound(989034)
	elseif( iFrame == 71 ) then
		angle = 0.7854
		if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		end

        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK3, 0.3, 0.7, false, angle )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_01", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_02", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:PlaySound(989034)
	elseif( iFrame == 76 ) then
		angle = 1.5708
		if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		end

        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK3, 0.0, 0.9, false, angle )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_01", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_02", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:PlaySound(989034)	
	elseif( iFrame == 81 ) then
		angle = 2.3562
		if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		end

        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK3, -0.4, 0.7, false, angle )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_01", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_02", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:PlaySound(989034)
	elseif( iFrame == 86 ) then
		angle = 3.1416
		if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		end

        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK3, -0.5, 0.56, false, angle )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_01", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_02", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:PlaySound(989034)
	elseif( iFrame == 91 ) then
		angle = 3.9270
		if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		end

        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK3, -0.4, 0.42, false, angle )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_01", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_02", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:PlaySound(989034)
	elseif( iFrame == 96 ) then
		angle = 4.7124
		if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		end

        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK3, 0.0, 0.22, false, angle )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_01", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_02", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:PlaySound(989034)
	elseif( iFrame == 101 ) then
		angle = 5.4978
		if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		end

        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER2_ATK3, 0.3, 0.42, false, angle )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_01", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Fire_Shot_02", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:PlaySound(989034)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

local posNx
local posNy

--  오버 드라이브
function Sentrykiper02_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper02_Smoke(iMonsterIndex, iFrame)
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 43 ) then
		pMonster:PlaySound(989003)
		local posx = 0.0
		local posy = 0.4
		pMonster:AddTraceParticleToBone( "SK1_Fury_Boom_01", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK1_Fury_Boom_02", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Fury_Boom_03", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK1_Fury_Boom_04", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK2_Fury_Boom_05", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_OVERDRIVE)
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_OVERDRIVE, 9999999.0, 1 );
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function Sentrykiper02_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper02_Smoke(iMonsterIndex, iFrame)
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame > 8 and pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
	
	if( iFrame == 8 ) then
		Sentrykiper02_Jump( iMonsterIndex )
		local posy = 0.0
		local posx = 0.0
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "SK_Buster_01", 1.0, 7, 7, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "SK_Buster_02", 1.0, 7, 7, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "SK_Buster_01", 1.0, 8, 7, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "SK_Buster_02", 1.0, 8, 7, 8, posx, posy, true )
		else
			pMonster:AddTraceParticleToBone( "SK_Buster_01_R", 1.0, 7, 7, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "SK_Buster_02_R", 1.0, 7, 7, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "SK_Buster_01_R", 1.0, 8, 7, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "SK_Buster_02_R", 1.0, 8, 7, 8, posx, posy, true )
		end
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 다운 상태
function Sentrykiper02_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper02_Smoke(iMonsterIndex, iFrame)
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 2 ) then
		local posy = 0.0
		local posx = 0.0
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "SK_Buster_01", 1.0, 7, 7, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "SK_Buster_02", 1.0, 7, 7, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "SK_Buster_01", 1.0, 8, 7, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "SK_Buster_02", 1.0, 8, 7, 8, posx, posy, true )
		else
			pMonster:AddTraceParticleToBone( "SK_Buster_01_R", 1.0, 7, 7, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "SK_Buster_02_R", 1.0, 7, 7, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "SK_Buster_01_R", 1.0, 8, 7, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "SK_Buster_02_R", 1.0, 8, 7, 8, posx, posy, true )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Sentrykiper02_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper02_Smoke(iMonsterIndex, iFrame)
    
    if( iFrame == 1 ) then
		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end
-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Sentrykiper02_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1666, 888, 1666, -888 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function Sentrykiper02_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -800, 460, 800, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Sentrykiper02_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Sentrykiper02_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -300, 800, 300, -800 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Sentrykiper02_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, 800, 300, -800 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Sentrykiper02_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 777, -333, 360, 333, -260 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Sentrykiper02_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -250, 300, 250, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Sentrykiper02_Check_Attack02_Combo( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:GetCountValue() >= 2 ) then
		pMonster:SetCountValue(0)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Sentrykiper02_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( (pMonster:GetHP() / pMonster:GetMaxHP()) < 0.5 ) then
		if ( pMonster:FloatRand() < 0.75 ) then
			pMonster:SetState( "ATTACK03" )
			pMonster:ResetDelay()
		end
	end
end

function Sentrykiper02_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 800, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Sentrykiper02_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 400, -400, -80, 400, -800 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnSentrykiper02_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnSentrykiper02_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnSentrykiper02_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK01" ) == false and pMonster:CheckState( "ATTACK02" ) == false and pMonster:CheckState( "ATTACK03" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:FloatRand() < 0.1 and pMonster:GetIsContact() == true ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK01" )
		end
	end

    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
end

function Sentrykiper02_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Sentrykiper02_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.06) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.025 )
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )		
		end
	end
end

function Sentrykiper02_Smoke( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	--[[
	if( math.mod( iFrame, 100 ) == 1 ) then
		local posx = 0.0
		local posy = 0.0
		
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Keeper_Steam", 1.0, 17, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Keeper_Steam", 1.0, 18, 8, 8, posx, posy )
		else
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Keeper_Steam_R", 1.0, 17, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Keeper_Steam_R", 1.0, 18, 8, 8, posx, posy, true )
		end
    end
    --]]
end