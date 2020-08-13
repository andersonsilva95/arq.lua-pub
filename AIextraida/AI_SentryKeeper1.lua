-- AI_Sentrykiper01.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Sentrykiper01_Wait.frm",
        Func    = "Sentrykiper01_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Sentrykiper01_Check_Targeting",
                DelayFrame          = 40,
            },

            -- 타겟지움
            --{
            --	AICheckFrame        = 300,
            --	AIFunc              = "Sentrykiper01_Check_ReleaseTarget",
            --	DelayFrame          = 100,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "Sentrykiper01_Check_TurnToTarget",
                DelayFrame          = 5,
            },

            -- 걷기
            {
                AICheckFrame        = 300,
                AIFunc              = "Sentrykiper01_Check_Walk",
                DelayFrame          = 300,
            },

            -- 점프업
            {
                AICheckFrame        = 191,
                AIFunc              = "Sentrykiper01_Check_JumpUp",
                DelayFrame          = 350,
				DelayFrame1         = 300,
				DelayFrame2         = 250,
				DelayFrame3         = 250,
            },        

            -- 점프다운
            {
                AICheckFrame        = 50,
                AIFunc              = "Sentrykiper01_Check_JumpDown",
                DelayFrame          = 200,
            },

			-- 쇼크 웨이브
            {
                AICheckFrame        = 11,
                AIFunc              = "Sentrykiper01_Check_Attack01",
                DelayFrame          = 299,
				DelayFrame1         = 199,
				DelayFrame2         = 99,
				DelayFrame3         = 99,
            },

            -- 샤크 미사일
            {
                AICheckFrame        = 100,
                AIFunc              = "Sentrykiper01_Check_Attack02",
                DelayFrame          = 400,
				DelayFrame1         = 300,
				DelayFrame2         = 200,
				DelayFrame3         = 200,
            },

			-- 샤크 미사일 콤보
            {
                AICheckFrame        = 1,
                AIFunc              = "Sentrykiper01_Check_Attack02_Combo",
                DelayFrame          = 100,
            },

            -- 라그나록 빔
            {
                AICheckFrame        = 250,
                AIFunc              = "Sentrykiper01_Check_Attack03",
                DelayFrame          = 1000,
				DelayFrame1         = 800,
				DelayFrame2         = 500,
				DelayFrame3         = 500,
            },

		},
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Sentrykiper02_move.frm",
        Func            = "Sentrykiper01_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Sentrykiper01_MoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 20,
                AIFunc              = "Sentrykiper01_Check_Targeting",
                DelayFrame          = 40,
            },

			-- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "Sentrykiper01_Check_TurnToTarget",
                DelayFrame          = 5,
            },
            -- 점프업
            {
                AICheckFrame        = 31,
                AIFunc              = "Sentrykiper01_Check_JumpUp",
                DelayFrame          = 40,
            },        
            -- 점프다운
            {
                AICheckFrame        = 32,
                AIFunc              = "Sentrykiper01_Check_JumpDown",
                DelayFrame          = 20,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "Sentrykiper01_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Sentrykiper01_Attack01.frm",
        Func    = "Sentrykiper01_Attack01Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02",
        Motion  = "Sentrykiper01_Attack02.frm",
        Func    = "Sentrykiper01_Attack02Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK03",
        Motion  = "Sentrykiper01_Attack03.frm",
        Func    = "Sentrykiper01_Attack03Func",
    },
    
    -- 근접공격3
    {
        ID      = "BUFF",
        Motion  = "Sentrykiper02_Buff.frm",
        Func    = "Sentrykiper01_Attack04Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Sentrykiper02_Jump_Up.frm",
        Func    = "Sentrykiper01_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Sentrykiper02_Jump_Down.frm",
        Func    = "Sentrykiper01_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Sentrykiper02_Jump_Landing.frm",
        Func    = "Sentrykiper01_ToWait",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Sentrykiper02_Die.frm",
        Func    = "Sentrykiper01_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "OnSentrykiper01_Land",
    Die     = "OnSentrykiper01_Die",
    Damage  = "OnSentrykiper01_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitSentrykiper01( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:AddTraceParticleToBone( "Shovel_Steam", 1.0, 0, 8, 8, 0.0, 0.0, true )
    pMonster:AddTraceParticleToBone( "Shovel_Steam", 1.0, 9, 8, 8, 0.0, 0.0, true )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Sentrykiper01_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper01_Smoke(iMonsterIndex, iFrame)
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Sentrykiper01_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    Sentrykiper01_Smoke(iMonsterIndex, iFrame)

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
function Sentrykiper01_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 ) -- 2호기

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(989001)
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_OVERDRIVE)
	elseif( iFrame == pMonster:GetLastFrame() - 5 ) then
		if( pMon:GetHP() > 0 and false == pMon:IsMagicEffect( 1, EGC_EFFECT_OVERDRIVE ) ) then
			pMon:SetState("BUFF")
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Sentrykiper01_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper01_Smoke(iMonsterIndex, iFrame)

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Sentrykiper01_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper01_Smoke(iMonsterIndex, iFrame)
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 28 ) then
		local posx = 0.2
		local posy = 0.0
		
		if( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
		end
		pMonster:AddTraceParticleToBone( "SK1_Wave_Shot_01", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK1_Wave_Shot_02", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK1_Wave_Shot_03", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:PlaySound(989004)
    elseif( iFrame == 52 ) then
		pMonster:AddDamage(DT_SENTRYKEEPER1_ATK1)
	elseif( iFrame == 54 ) then
		local posx = 0.4
		local posy = 0.35
		
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "SK1_Wave_01", posx, posy )
			pMonster:AddParticle( "SK1_Wave_02", posx, posy )
			pMonster:AddParticle( "SK1_Wave_03", posx, posy )
			pMonster:AddParticle( "SK1_Wave_04", posx, posy )
			pMonster:AddParticle( "SK1_Wave_05", posx, posy )
			pMonster:AddParticle( "SK1_Wave_06", posx, posy )
			pMonster:AddParticle( "SK1_Wave_07", posx, posy )
		else
			posx = posx * -1.0
			pMonster:AddParticleNoDirection( "SK1_Wave_01_R", posx, posy )
			pMonster:AddParticleNoDirection( "SK1_Wave_02"  , posx, posy )
			pMonster:AddParticleNoDirection( "SK1_Wave_03_R", posx, posy )
			pMonster:AddParticleNoDirection( "SK1_Wave_04"  , posx, posy )
			pMonster:AddParticleNoDirection( "SK1_Wave_05"  , posx, posy )
			pMonster:AddParticleNoDirection( "SK1_Wave_06"  , posx, posy )
			pMonster:AddParticleNoDirection( "SK1_Wave_07"  , posx, posy )
		end
		
		posx = 0.3
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "SK_Scratch_R",posx, 0.0 )
		else
			pMonster:AddParticleNoDirection( "SK_Scratch",  -posx, 0.0 )
		end
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function Sentrykiper01_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper01_Smoke(iMonsterIndex, iFrame)
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 52 ) then
		pMonster:ComputeAngleToTarget( 0.1, 0.20, -70, 70 ) -- 타겟으로의 각도를 계산
        angle = pMonster:GetAngleToTarget()
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
        end
        pMonster:AddDamageWithLocateAngle( DT_SENTRYKEEPER1_ATK2, 0.1, 0.38, false, angle )
		pMonster:AddDamageWithLocate( DT_SENTRYKEEPER1_ATK2_DESTINATION, pMonster:GetTargetX(), pMonster:GetTargetY(), true )
	elseif( iFrame == 53 ) then
		pMonster:PlaySound(989005)
		local posx = 0.2
		local posx1 = 0.3
		local posy = 0.38
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "SK_Missile_Shot_01", posx1, posy )
			pMonster:AddParticleNoDirection( "SK_Missile_Shot_02", posx1, posy )
			pMonster:AddParticleNoDirection( "SK_Missile_Shot_03", posx1, posy )
			pMonster:AddParticleNoDirection( "SK_Scratch_R",posx, 0.0 )
		else
			pMonster:AddParticleNoDirection( "SK_Missile_Shot_01_R", -posx1, posy )
			pMonster:AddParticleNoDirection( "SK_Missile_Shot_02", -posx1, posy )
			pMonster:AddParticleNoDirection( "SK_Missile_Shot_03", -posx1, posy )
			pMonster:AddParticleNoDirection( "SK_Scratch",  -posx, 0.0 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function Sentrykiper01_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper01_Smoke(iMonsterIndex, iFrame)
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 39 ) then
		pMonster:PlaySound(989030)
		pMonster:SkillReadyEffect(128, 255, 128, 0.5)
		local posx = 0.0
		pMonster:AddTraceParticleToBone( "SK1_Ragnarok_Charge_01", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK1_Ragnarok_Charge_02", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK1_Ragnarok_Charge_03", 1.0, 22, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK1_Ragnarok_Charge_04", 1.0, 22, 8, 8, posx, posy, true )
	elseif( iFrame == 57 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamage(DT_SENTRYKEEPER1_ATK3_PARTICLE)
		else
			pMonster:AddDamage(DT_SENTRYKEEPER1_ATK3_PARTICLE_R)
		end
	elseif( iFrame == 83 ) then
		pMonster:SetPushCheck( false )
	elseif( iFrame == 84 ) then
		pMonster:AddDamage(DT_SENTRYKEEPER1_ATK3)
	elseif( iFrame == 87 ) then
		pMonster:PlaySound(989031)
		local posx = 0.3
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "SK_Scratch_R",posx, 0.0 )
		else
			pMonster:AddParticleNoDirection( "SK_Scratch",  -posx, 0.0 )
		end
		pMonster:AddTraceParticleToBone( "SK1_Ragnarok_Body_01", 1.0, -1, 8, 8, 0.0, 0.0, true )
		pMonster:AddTraceParticleToBone( "SK1_Ragnarok_Body_02", 1.0, -1, 8, 8, 0.0, 0.0, true )
	elseif( iFrame == 93 ) then
		pMonster:SetPushCheck( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

local posNx
local posNy
--  
function Sentrykiper01_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper01_Smoke(iMonsterIndex, iFrame)
    
	
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 43 ) then
		pMonster:PlaySound(989003)
		local posx = 0.0
		local posy = 0.4
		pMonster:AddTraceParticleToBone( "SK1_Fury_Boom_01", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK1_Fury_Boom_02", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK1_Fury_Boom_03", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK1_Fury_Boom_04", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "SK1_Fury_Boom_05", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_OVERDRIVE)
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_OVERDRIVE, 9999999.0, 1 );
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function Sentrykiper01_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper01_Smoke(iMonsterIndex, iFrame)
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame > 8 and pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
	
	if( iFrame == 8 ) then
		Sentrykiper01_Jump( iMonsterIndex )
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
function Sentrykiper01_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper01_Smoke(iMonsterIndex, iFrame)
    
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
function Sentrykiper01_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    Sentrykiper01_Smoke(iMonsterIndex, iFrame)
    
    if( iFrame == 1 ) then
		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end
-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Sentrykiper01_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1666, 888, 1666, -888 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function Sentrykiper01_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -800, 460, 800, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Sentrykiper01_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Sentrykiper01_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -400, 800, 400, -800 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Sentrykiper01_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -400, 800, 400, -800 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Sentrykiper01_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 200, 200, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Sentrykiper01_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 450, -300, 360, 300, -260 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Sentrykiper01_Check_Attack02_Combo( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:GetCountValue() >= 2 ) then
		pMonster:SetCountValue(0)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Sentrykiper01_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( (pMonster:GetHP() / pMonster:GetMaxHP()) < 0.5 ) then
		if( pMonster:CheckTargetInRange( 350, -350, 230, 350, -100 ) == true ) then
			pMonster:SetState( "ATTACK03" )
			pMonster:ResetDelay()
		end
	end
end

function Sentrykiper01_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 800, 200, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Sentrykiper01_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, -80, 200, -800 ) == true ) then
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
function OnSentrykiper01_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnSentrykiper01_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end
	
	pMonster:SetState( "DIE_LANDING" )
end

function OnSentrykiper01_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK01" ) == false and pMonster:CheckState( "ATTACK02" ) == false and pMonster:CheckState( "ATTACK03" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true ) then
			pMonster:TurnToTarget()
			if( pMonster:CheckTargetInRange( 200, -200, 200, 200, -100 ) == true ) then
				pMonster:SetState( "ATTACK01" )
			else
				pMonster:SetState( "ATTACK02" )
			end
		end
	end

    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
end

function Sentrykiper01_Jump( iMonsterIndex )
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

function Sentrykiper01_MoveFail( iMonsterIndex )
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

function Sentrykiper01_Smoke( iMonsterIndex, iFrame )
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