-- AI_Hatshepsut.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Hatshepsut_Wait.frm",
        Func    = "Hatshepsut_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Hatshepsut_Check_Targeting",
                DelayFrame          = 40,
            },

            -- 타겟지움
            --{
            --    AICheckFrame        = 150,
            --    AIFunc              = "Hatshepsut_Check_ReleaseTarget",
            --    DelayFrame          = 100,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "Hatshepsut_Check_TurnToTarget",
                DelayFrame          = 9,
            },

            -- 걷기
            {
                AICheckFrame        = 50,
                AIFunc              = "Hatshepsut_Check_Walk",
                DelayFrame          = 100,
            },

            -- 점프업
            {
                AICheckFrame        = 67,
                AIFunc              = "Hatshepsut_Check_JumpUp",
                DelayFrame          = 55,
            },        

            -- 점프다운
            {
                AICheckFrame        = 68,
                AIFunc              = "Hatshepsut_Check_JumpDown",
                DelayFrame          = 10,
            },

			-- 흡수
            {
                AICheckFrame        = 10,
                AIFunc              = "Hatshepsut_Check_Attack01",
                DelayFrame          = 220,
            },

            -- 데들리 암
            {
                AICheckFrame        = 35,
                AIFunc              = "Hatshepsut_Check_Attack02",
                DelayFrame          = 155,
            },

            -- 라이트닝 볼트
            {
                AICheckFrame        = 100,
                AIFunc              = "Hatshepsut_Check_Attack03",
                DelayFrame          = 220,
            },

            -- 슈팅 스톤
            {
                AICheckFrame        = 155,
                AIFunc              = "Hatshepsut_Check_Attack04",
                DelayFrame          = 221,
            },

			-- 깨미 소환
            {
                AICheckFrame        = 300,
                AIFunc              = "Hatshepsut_Check_Summon",
                DelayFrame          = 400,
            },
--[[
			-- 버프 광폭화
            {
                AICheckFrame        = 400,
                AIFunc              = "Hatshepsut_Check_Attack05",
                DelayFrame          = 100,
            },
--]]
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Hatshepsut_walk.frm",
        Func            = "Hatshepsut_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Hatshepsut_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "Hatshepsut_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            --{
            --    AICheckFrame        = 220,
            --    AIFunc              = "Hatshepsut_Check_ReleaseTarget",
            --    DelayFrame          = 440,
            --},
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "Hatshepsut_Check_TurnToTarget",
                DelayFrame          = 5,
            },
            -- 점프업
            {
                AICheckFrame        = 30,
                AIFunc              = "Hatshepsut_Check_JumpUp",
                DelayFrame          = 44,
            },        
            -- 점프다운
            {
                AICheckFrame        = 30,
                AIFunc              = "Hatshepsut_Check_JumpDown",
                DelayFrame          = 8,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "Hatshepsut_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Hatshepsut_Attack01.frm",
        Func    = "Hatshepsut_Attack01Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02",
        Motion  = "Hatshepsut_Attack02.frm",
        Func    = "Hatshepsut_Attack02Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK03",
        Motion  = "Hatshepsut_Attack03.frm",
        Func    = "Hatshepsut_Attack03Func",
    },
    
    -- 근접공격4
    {
        ID      = "ATTACK04",
        Motion  = "Hatshepsut_Attack04.frm",
        Func    = "Hatshepsut_Attack04Func",
    },
    
	-- 근접공격4_2
    {
        ID      = "ATTACK04_2",
        Motion  = "Hatshepsut_Attack04.frm",
        Func    = "Hatshepsut_Attack04_2Func",
    },

    -- 버프
    {
        ID      = "BUFF01",
        Motion  = "Hatshepsut_buff.frm",
        Func    = "Hatshepsut_BuffFunc",
    },
    
    -- 소환
    {
        ID      = "SUMMON",
        Motion  = "Hatshepsut_summons.frm",
        Func    = "Hatshepsut_SummonFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Hatshepsut_Jump_Up.frm",
        Func    = "Hatshepsut_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Hatshepsut_Jump_Down.frm",
        Func    = "Hatshepsut_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Hatshepsut_Jump_Landing.frm",
        Func    = "Hatshepsut_ToWait",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Hatshepsut_Damage_Up.frm",
        Func    = "Hatshepsut_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Hatshepsut_Damage_Middle.frm",
        Func    = "Hatshepsut_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Hatshepsut_Damage_Down.frm",
        Func    = "Hatshepsut_DamageFunc",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Hatshepsut_Die.frm",
        Func    = "Hatshepsut_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
        
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Hatshepsut_Stone.frm",
        Func    = "Hatshepsut_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Hatshepsut_Stone.frm",
        Func    = "Hatshepsut_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Hatshepsut_Stone.frm",
		Func	= "Hatshepsut_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnHatshepsut_Land",
    Die     = "OnHatshepsut_Die",
    Damage  = "OnHatshepsut_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitHatshepsut( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:RegisterSummonMonsterType( MON_TUNNEL_HUGATE )
    
    pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Hatshepsut_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Hatshepsut_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기 착지
function Hatshepsut_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(993016)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Hatshepsut_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Hatshepsut_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 and pMonster:GetHP() <= pMonster:GetMaxHP() * 0.3 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 35 ) then
		pMonster:AddDamage( DT_HATSHEPSUT_ABSORPTION_DECO1 )
    elseif( iFrame == 60 ) then
		pMonster:AddDamage(DT_HATSHEPSUT_ABSORPTION)
    elseif( iFrame == 180 ) then
		pMonster:AddDamage( DT_HATSHEPSUT_ABSORPTION_DECO2 )
		pMonster:PlaySound(993018)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function Hatshepsut_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 64 ) then
		pMonster:AddDamage( DT_HATSHEPSUT_DEADLY_ARM )
		pMonster:PlaySound(993019)
	elseif( iFrame == 87 ) then
		pMonster:AddDamage( DT_HATSHEPSUT_DEADLY_ARM_2 )
		pMonster:PlaySound(993019)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function Hatshepsut_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 36 ) then
		pMonster:PlaySound(993020)
		local posx = 0.41
		local posy = 0.75
		if ( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
		end
		
		pMonster:AddParticleNoDirection("Hatshepsut_Charge_01", posx, posy)
		pMonster:AddParticleNoDirection("Hatshepsut_Charge_02", posx, posy)
		pMonster:AddParticleNoDirection("Hatshepsut_Charge_03", posx, posy)
		pMonster:AddParticleNoDirection("Hatshepsut_Charge_04", posx, posy)
	elseif( iFrame >= 102 and iFrame < 215 ) then
		if ( iFrame == 102 ) then
			pMonster:ComputeAngleToTarget( 0.41, 0.57 ) -- 타겟으로의 각도를 계산
			angle = pMonster:GetAngleToTarget()
			pMonster:PlaySound(993021)
		end
		
		if( math.mod( iFrame, 2 ) == 0 ) then
			pMonster:AddDamageWithLocate( DT_LIGHTNING_GENERATE1, 0.3, 0.6 )
			pMonster:AddDamageWithLocate( DT_HATSHEPSUT_LIGHTNING_BOLT, 0.8, 0.8 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function Hatshepsut_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )

	elseif( iFrame >= 65 and iFrame <= 140 ) then
		if( math.mod( iFrame -5, 15 ) == 0 ) then
			pMonster:CameraVib( 1, 0.6, 0.004 )
			pMonster:AddParticle("Hatshepsut_Dust_01", 0.0, 0.0)
			pMonster:AddParticle("Hatshepsut_Dust_02", 0.0, 0.0)
			pMonster:AddParticle("Hatshepsut_Dust_03", 0.0, 0.0)
			pMonster:PlaySound(993015)
		end
	elseif( iFrame == 141 ) then
		pMonster:AddParticle("Hatshepsut_Stone_Tip_01", -0.0, 0.1, true)
		pMonster:AddParticle("Hatshepsut_Stone_Tip_02", -0.0, 0.1, true)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, -1.80, 2.3)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, -1.40, 0.4)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, -1.00, 1.5)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, -0.50, 1.8)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, 0.25, 2.3)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, 0.50, 0.8)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, 1.00, 1.1)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, 1.40, 2.1)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, 1.90, 1.6)
		pMonster:CameraVib( 1, 0.6, 0.004 )

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Hatshepsut_Attack04_2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )

	elseif( iFrame >= 65 and iFrame <= 140 ) then
		if( math.mod( iFrame -5, 15 ) == 0 ) then
			pMonster:CameraVib( 1, 0.6, 0.004 )
			pMonster:AddParticle("Hatshepsut_Dust_01", 0.0, 0.0)
			pMonster:AddParticle("Hatshepsut_Dust_02", 0.0, 0.0)
			pMonster:AddParticle("Hatshepsut_Dust_03", 0.0, 0.0)
			pMonster:PlaySound(993015)
		end
	elseif( iFrame == 141 ) then
		pMonster:AddParticle("Hatshepsut_Stone_Tip_01", -0.0, -0.1, true)
		pMonster:AddParticle("Hatshepsut_Stone_Tip_02", -0.0, -0.1, true)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, -1.85, 2.5)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, -1.40, 0.9)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, -1.10, 1.8)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, -0.70, 1.4)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, -0.30, 0.4)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, 0.30, 1.1)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, 0.70, 2.1)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, 1.10, 0.7)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, 1.50, 1.7)
		pMonster:AddDamageWithLocate( DT_HATSHEPSUT_SHOOTING_STONE, 1.90, 2.7)
		pMonster:CameraVib( 1, 0.6, 0.004 )

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function Hatshepsut_BuffFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 94 ) then
		pMonster:PlaySound(993017)
		local posy = 0.35
		local buffLevel = pMonster:GetCountValue()
		pMonster:ClearMagicEffect( iMonsterIndex, EGC_EFFECT_HATSHEPSUT_BUFF_1 - 2 + buffLevel )
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_HATSHEPSUT_BUFF_1 - 1 + buffLevel, 9999999.0, 1, -1, false, false );
		--pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_HATSHEPSUT_BUFF, 9999999.0, pMonster:GetBuffLevel( iMonsterIndex, EGC_EFFECT_HATSHEPSUT_BUFF ) + 1, -1, false, false )
		pMonster:AddParticleNoDirection("Hatshepsut_Fury_Boom_01", 0.0, posy)
		pMonster:AddParticleNoDirection("Hatshepsut_Fury_Boom_02", 0.0, posy)
		pMonster:AddParticleNoDirection("Hatshepsut_Fury_Boom_03", 0.0, posy)
		pMonster:AddParticleNoDirection("Hatshepsut_Fury_Boom_04", 0.0, posy)
		pMonster:AddParticleNoDirection("Hatshepsut_Fury_Boom_05", 0.0, posy)
		pMonster:AddParticleNoDirection("Hatshepsut_Fury_Boom_06", 0.0, posy)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Hatshepsut_SummonFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0)
	if( iFrame == 54 ) then
		local pMon = KSummonInfo()

		pMonster:AddParticle("Setesh_Summon_01", 0.0, 0.0)
		pMonster:AddParticle("Setesh_Summon_02", 0.0, 0.0)
		pMonster:AddParticle("Setesh_Summon_03", 0.0, 0.0)
		pMonster:AddParticle("Setesh_Summon_04", 0.0, 0.0)
		pMonster:AddParticle("Setesh_Summon_05", 0.0, 0.0)

        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_TUNNEL_HUGATE
        pMon.fX = -300
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
        
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_TUNNEL_HUGATE
        pMon.fX = 300
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  점프 상태
function Hatshepsut_JumpFunc( iMonsterIndex, iFrame )
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
function Hatshepsut_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Hatshepsut_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Hatshepsut_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetInvincible( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end

--  아이스커스 걸렸음
function Hatshepsut_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end


-- 홀드 걸렸음(이펙트)
function Hatshepsut_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Small", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Hatshepsut_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1666, 999, 1666, -999 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function Hatshepsut_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 200, -800, 500, 800, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Hatshepsut_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Hatshepsut_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -300, 1200, 300, -800 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Hatshepsut_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, 1200, 300, -800 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Hatshepsut_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Hatshepsut_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    local pMon1 = g_MyD3D:GetMonster( 1 )
    local pMon2 = g_MyD3D:GetMonster( 2 )
    local pMon3 = g_MyD3D:GetMonster( 3 )

	if( ( pMon1:GetHP() > 0.0 or pMon2:GetHP() > 0.0 or pMon3:GetHP() > 0.0 ) and ((pMonster:GetHP() / pMonster:GetMaxHP()) < 0.5) ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Hatshepsut_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 140, -140, 200, 140, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Hatshepsut_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -230, 1200, 230, -900 ) == false ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Hatshepsut_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -600, 700, 600, -700 ) == true ) then
		if( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK04" )
		else
			pMonster:SetState( "ATTACK04_2" )
		end

		pMonster:ResetDelay()
	end
end

function Hatshepsut_Check_Summon( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetSummonedMonsterCount() < 2 ) then
		pMonster:SetState( "SUMMON" )
		pMonster:ResetDelay()
	end
end

function Hatshepsut_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetBuffLevel( iMonsterIndex, EGC_EFFECT_HATSHEPSUT_BUFF ) < 3 ) then
		pMonster:SetState( "BUFF01" )
		pMonster:ResetDelay()
	end
end

function Hatshepsut_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 1200, 300, 180 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Hatshepsut_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Hatshepsut_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, -100, 300, -800 ) == true ) then
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
function OnHatshepsut_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnHatshepsut_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnHatshepsut_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK01" ) == false and pMonster:CheckState( "ATTACK02" ) == false and pMonster:CheckState( "ATTACK03" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true ) then
			pMonster:TurnToTarget()
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK03" )
			else
				if( pMonster:FloatRand() < 0.5 ) then
					pMonster:SetState( "ATTACK04" )
				else
					pMonster:SetState( "ATTACK04_2" )
				end
			end
		end
	end

    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
--[[ 위에 있는 반격은 모지..
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if ( pMonster:FloatRand() < 0.12 and pMonster:GetIsContact() == true and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
			pMonster:SetState( "ATTACK03" )
		end
	end
--]]
end

function Hatshepsut_Jump( iMonsterIndex )
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

function Hatshepsut_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )			
		end
	end
end