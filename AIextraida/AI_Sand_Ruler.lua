-- AI_SandRuler.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "SandRuler_Wait.frm",
        Func    = "SandRuler_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 10,
                AIFunc              = "SandRuler_Check_Targeting",
                DelayFrame          = 40,
            },

            -- 타겟지움
            --{
            --    AICheckFrame        = 150,
            --    AIFunc              = "SandRuler_Check_ReleaseTarget",
            --    DelayFrame          = 100,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "SandRuler_Check_TurnToTarget",
                DelayFrame          = 20,
            },

            -- 걷기 [75%]
            {
                AICheckFrame        = 50,
                AIFunc              = "SandRuler_Check_Walk",
                DelayFrame          = 100,
            },

            -- 점프업
            {
                AICheckFrame        = 51,
                AIFunc              = "SandRuler_Check_JumpUp",
                DelayFrame          = 100,
            },        

            -- 점프다운
            {
                AICheckFrame        = 52,
                AIFunc              = "SandRuler_Check_JumpDown",
                DelayFrame          = 80,
            },

			-- 헌팅 호른
            {
                AICheckFrame        = 10,
                AIFunc              = "SandRuler_Check_Attack01",
                DelayFrame          = 111,
            },

            -- 비틀 플라이
            {
                AICheckFrame        = 22,
                AIFunc              = "SandRuler_Check_Attack02",
                DelayFrame          = 150,
            },

            -- 스톰 윈드
            {
                AICheckFrame        = 33,
                AIFunc              = "SandRuler_Check_Attack03",
                DelayFrame          = 250,
            },

			-- 베이비 벅스 [50%]
            {
                AICheckFrame        = 200,
                AIFunc              = "SandRuler_Check_Attack04",
                DelayFrame          = 800,
            },

		},
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "SandRuler_walk.frm",
        Func            = "SandRuler_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "SandRuler_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 30,
                AIFunc              = "SandRuler_Check_Targeting",
                DelayFrame          = 30,
            },
            -- 타겟지움
            --{
            --    AICheckFrame        = 220,
            --    AIFunc              = "SandRuler_Check_ReleaseTarget",
            --    DelayFrame          = 440,
            --},
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 10,
                AIFunc              = "SandRuler_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- 점프업
            {
                AICheckFrame        = 42,
                AIFunc              = "SandRuler_Check_JumpUp",
                DelayFrame          = 80,
            },        
            -- 점프다운
            {
                AICheckFrame        = 41,
                AIFunc              = "SandRuler_Check_JumpDown",
                DelayFrame          = 60,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "SandRuler_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "SandRuler_Attack01.frm",
        Func    = "SandRuler_Attack01Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02",
        Motion  = "SandRuler_Attack02.frm",
        Func    = "SandRuler_Attack02Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK03",
        Motion  = "SandRuler_Attack03.frm",
        Func    = "SandRuler_Attack03Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK03_R",
        Motion  = "SandRuler_Attack03_R.frm",
        Func    = "SandRuler_Attack03_RFunc",
    },
    
    -- 근접공격4
    {
        ID      = "ATTACK04",
        Motion  = "Sandruler_Attack04_A.frm",
        Func    = "SandRuler_Attack04Func",
    },
    
    {
        ID      = "ATTACK04_LOOP",
        Motion  = "Sandruler_Attack04_B.frm",
        Func    = "SandRuler_Attack04LoopFunc",
    },
    
    {
        ID      = "ATTACK04_END",
        Motion  = "Sandruler_Attack04_C.frm",
        Func    = "SandRuler_Attack04EndFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "SandRuler_Jump_Up.frm",
        Func    = "SandRuler_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "SandRuler_Jump_Down.frm",
        Func    = "SandRuler_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "SandRuler_Jump_Landing.frm",
        Func    = "SandRuler_ToWait",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "SandRuler_Damage_Up.frm",
        Func    = "SandRuler_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "SandRuler_Damage_Middle.frm",
        Func    = "SandRuler_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "SandRuler_Damage_Down.frm",
        Func    = "SandRuler_DamageFunc",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "SandRuler_Die.frm",
        Func    = "SandRuler_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
        
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "SandRuler_Stone.frm",
        Func    = "SandRuler_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "SandRuler_Stone.frm",
        Func    = "SandRuler_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "SandRuler_Stone.frm",
		Func	= "SandRuler_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnSandRuler_Land",
    Die     = "OnSandRuler_Die",
    Damage  = "OnSandRuler_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitSandRuler( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )

    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_DOWN" )

	--pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    --pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    --pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    
    
    pMonster:AddTraceParticleToBone( "Sand_Ruler_Eyeflame", 0.5, 7, 8, 2, 0.0, 0.0 )
    pMonster:AddTraceParticleToBone( "Sand_Ruler_Eyeflame", 0.5, 8, 8, 2, 0.0, 0.0 )
    --pMonster:AddTraceParticleToBone( "Sand_Ruler_Hornflame", 0.001, 9, 8, 8, 0.0, -0.1 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function SandRuler_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function SandRuler_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if ( (iFrame >= 36 and iFrame <= 40) or (iFrame >= 76 and iFrame <= 80) ) then
		pMonster:SetSpeedX( 0 )
	else
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	end
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기 착지
function SandRuler_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(990001)
	elseif( iFrame == pMonster:GetLastFrame() - 5 ) then
		local posx = 0.0
		local posy = 0.1
		pMonster:AddParticle("Horus_01" , posx, posy)
		pMonster:AddParticle("Horus_02" , posx, posy)
		pMonster:AddParticle("Horus_03" , posx, posy)
		pMonster:AddParticle("Horus_04" , posx, posy)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function SandRuler_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function SandRuler_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 52 ) then
		pMonster:AddDamage(DT_SANDRULER_ATK1)
	elseif( iFrame == 55 ) then
		pMonster:PlaySound(990002)
		local posx = 0.7
		local posy = -0.3
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Sand_Ruler_Horn_01", 1.0, 45, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Sand_Ruler_Horn_02", 1.0, 45, 8, 8, posx, posy, true )
		else
			pMonster:AddTraceParticleToBone( "Sand_Ruler_Horn_01_R", 1.0, 45, 8, 8, -posx, posy, true )
			pMonster:AddTraceParticleToBone( "Sand_Ruler_Horn_02_R", 1.0, 45, 8, 8, -posx, posy, true )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

local interval
--  근접공격2 상태
function SandRuler_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local targetY
    local processFrame = 20
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetFly(true)
	elseif( iFrame == 21 ) then
		local posx = 0.0
		local posy = 0.0
		pMonster:AddParticleNoDirection("SK_Scratch", posx, posy )
		pMonster:AddParticleNoDirection("SK_Scratch_R", posx, posy )
	elseif( iFrame == 50 ) then
		pMonster:AddDamage(DT_SANDRULER_ATK2)
		targetY = pMonster:GetTargetY()
		interval = (targetY - pMonster:GetY()) / processFrame
		pMonster:SetPushCheck( false )
		pMonster:PlaySound(990003)
	elseif( iFrame >= 51 and iFrame <= 96 ) then
		pMonster:SetSpeedY( interval )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFly(false)
		pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
    
    if( (false == pMonster:GetIsRight() and pMonster:GetX() < 0.4 ) or ( true == pMonster:GetIsRight() and pMonster:GetX() + 0.4 > pMonster:GetStageX() ) ) then
		pMonster:SetSpeedY( 0.0 )
    end
end

--  
function SandRuler_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 59 ) then
		pMonster:AddDamage(DT_SANDRULER_ATK3_R)
		pMonster:AddDamage(DT_SANDRULER_ATK3_L)
	elseif( iFrame == 62 ) then
		local posx = 0.0
		local posy = 0.3
		pMonster:AddTraceParticleToBone( "Sand_Ruler_Wind_01", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "Sand_Ruler_Wind_02", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "Sand_Ruler_Wind_03", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:PlaySound(990004)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function SandRuler_Attack03_RFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 59 ) then
		pMonster:AddDamage(DT_SANDRULER_ATK3_R)
		pMonster:AddDamage(DT_SANDRULER_ATK3_L)
	elseif( iFrame == 62 ) then
		local posx = 0.0
		local posy = 0.3
		pMonster:AddTraceParticleToBone( "Sand_Ruler_Wind_01", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "Sand_Ruler_Wind_02", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:AddTraceParticleToBone( "Sand_Ruler_Wind_03", 1.0, -1, 8, 8, posx, posy, true )
		pMonster:PlaySound(990004)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function SandRuler_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetCountValue(0)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK04_LOOP" )
    end
end

--  
function SandRuler_Attack04LoopFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 30 ) then
		pMonster:AddDamageWithLocate(DT_SANDRULER_ATK4_LAUNCHER, -0.55, -0.2, false)
	elseif( iFrame == 33 ) then
		local posx = 0.0
		local posy = 0.0
		pMonster:AddTraceParticleToBone( "Sand_Ruler_Babyshot", 1.0, 45, 8, 8, posx, posy, true )
		pMonster:PlaySound(990006)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetCountValue() >= 7 ) then
			pMonster:SetState( "ATTACK04_END" )
		else
			pMonster:AddCountValue(1)
			pMonster:SetState( "ATTACK04_LOOP" )
		end
    end
end

--  
function SandRuler_Attack04EndFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetCountValue(0)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function SandRuler_JumpFunc( iMonsterIndex, iFrame )
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
function SandRuler_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function SandRuler_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function SandRuler_StoneCurseFunc( iMonsterIndex, iFrame )
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
function SandRuler_IceCurseFunc( iMonsterIndex, iFrame )
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
function SandRuler_HoldFunc( iMonsterIndex, iFrame )
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

function SandRuler_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1666, 888, 1666, -888 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function SandRuler_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 200, -800, 500, 800, -500 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function SandRuler_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function SandRuler_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -300, 800, 300, -800 ) == false and pMonster:FloatRand() < 0.75 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function SandRuler_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, 800, 300, -800 ) == true ) then
		pMonster:SetSpeedX( 0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function SandRuler_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function SandRuler_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 165, -110, 180, 110, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function SandRuler_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 700, -400, 500, 400, -400 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function SandRuler_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -330, 200, 330, -100 ) == true ) then
		if( false == pMonster:GetIsRight() ) then
			pMonster:SetState( "ATTACK03" )
		else
			pMonster:SetState( "ATTACK03_R" )
		end
		pMonster:ResetDelay()
	end
end

function SandRuler_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function SandRuler_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 800, 300, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		SandRuler_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function SandRuler_Check_JumpDown( iMonsterIndex, iFrame )
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
function OnSandRuler_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnSandRuler_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnSandRuler_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK01" ) == false and pMonster:CheckState( "ATTACK02" ) == false and pMonster:CheckState( "ATTACK03" ) == false and pMonster:CheckState( "ATTACK03_R" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true ) then
			if( pMonster:CheckTargetInRange( 0, -330, 200, 330, -100 ) == true ) then
				if( false == pMonster:GetIsRight() ) then
					pMonster:SetState( "ATTACK03" )
				else
					pMonster:SetState( "ATTACK03_R" )
				end
			else
				if ( pMonster:FloatRand() < 0.5 ) then
					pMonster:SetState( "ATTACK04" )
				else
					pMonster:SetState( "ATTACK02" )
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

function SandRuler_Jump( iMonsterIndex )
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

function SandRuler_MoveFail( iMonsterIndex )
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