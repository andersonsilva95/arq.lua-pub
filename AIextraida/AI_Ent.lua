-- AI_Ent.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Ent_Wait.frm",
        Func    = "Ent_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "Ent_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향하여 돌기
            {
                AICheckFrame        = 45,
                AIFunc              = "Ent_Check_TurnToTarget",
                DelayFrame          = 110,
            },

            -- 걷기
            {
                AICheckFrame        = 55,
                AIFunc              = "Ent_Check_Walk",
                DelayFrame          = 110,
            },
            -- 2단공격
            {
                AICheckFrame        = 55,
                AIFunc              = "Ent_Check_Attack01",
                DelayFrame          = 220,
            },
            -- 땅파기공격
            {
                AICheckFrame        = 55,
                AIFunc              = "Ent_Check_Attack02",
                DelayFrame          = 330,
            },

            -- 사과던지기
            {
                AICheckFrame        = 55,
                AIFunc              = "Ent_Check_Attack03",
                DelayFrame          = 55,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Ent_Walk.frm",
        Func    = "Ent_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Ent_MoveFail",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "Ent_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향하여 돌기
            {
                AICheckFrame        = 25,
                AIFunc              = "Ent_Check_TurnToTarget",
                DelayFrame          = 75,
            },  
            -- 2단공격
            {
                AICheckFrame        = 75,
                AIFunc              = "Ent_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 멈추기
            {
                AICheckFrame        = 110,
                AIFunc              = "Ent_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },

    -- 2단공격
    {
        ID      = "ATTACK01",
        Motion  = "Ent_Attack01.frm",
        Func    = "Ent_Attack01Func",
    },

    -- 땅파기공격
    {
        ID      = "ATTACK02",
        Motion  = "Ent_Attack02.frm",
        Func    = "Ent_Attack02Func",
    },
    
    -- 사과던지기
    {
        ID      = "ATTACK03",
        Motion  = "Ent_Attack03.frm",
        Func    = "Ent_Attack03Func",
    },

    -- 데미지 상,중
    {
        ID      = "DAMAGE_UP",
        Motion  = "Ent_Damage_Up.frm",
        Func    = "Ent_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Ent_Damage_Down.frm",
        Func    = "Ent_DamageFunc",
    },
    
    -- 큰 데미지 
    {
        ID      = "DAMAGE_BIG",
        Motion  = "Ent_Damage.frm",
        Func    = "Ent_DamageFunc",
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Ent_Die.frm",
        Func    = "Ent_DieFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Ent_Stone.frm",
        Func    = "Ent_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Ent_Stone.frm",
        Func    = "Ent_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Ent_Stone.frm",
		Func	= "Ent_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnEnt_Land",
    Die     = "OnEnt_Die",
    Damage  = "OnEnt_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitEnt( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_BIG" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Ent_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Ent_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( (iFrame >= 0 and iFrame <= 49) or (iFrame >= 68 and iFrame <= 116) ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	end
    
	if( iFrame == 45 ) then
		--pMonster:PlaySound(211)
		pMonster:PlaySound(999039)
	elseif( iFrame == 108 ) then
		pMonster:PlaySound(999039)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end

end

-- 2단공격 상태
function Ent_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 97 ) then
		pMonster:PlaySound( "244" )
		pMonster:AddDamage( DT_MONSTER_ENT01 )
	elseif( iFrame >= 112 and iFrame < 130 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
	elseif( iFrame == 132 ) then
		pMonster:PlaySound( "244" )
		pMonster:AddDamage( DT_MONSTER_ENT02 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 땅파기공격 상태
function Ent_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 71 ) then
	    pMonster:StartText( "DANGER" )
        pMonster:PlaySound( "129" )
    elseif( iFrame == 75 ) then
		pMonster:SkillReadyEffectNoStop( 100, 200, 100, 0.0 )
	elseif( iFrame == 114 ) then
		pMonster:PlaySound( "47" )
		pMonster:AddDamage( DT_ENT_LAND )
		pMonster:AddDamage( DT_ENT_LAND_SMOKE )
		pMonster:EarthQuake( 19, 0.0, 0.0 )
	-- 10프레임 사이에 땅에 붙어있으면 줄기에 잡힌다..
	elseif( iFrame >= 115 and iFrame <= 125 ) then
        if( iFrame == 119 ) then
            -- 줄기가 튀어나오는 연출을 하기 위해.. 함수에 두번째 파라메터가 true이면 줄기 튀어나오는 이펙트 나온다
            pMonster:FreezeAttack( -0.01, true )
        else
            pMonster:FreezeAttack( -0.01, false )
        end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 사과던지기 상태
function Ent_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 22 ) then
        pMonster:ComputeAngleToTarget( 0.3, 0.6 ) -- 타겟으로의 각도를 계산
    elseif( iFrame == 131 ) then
        pMonster:AddDamageWithAngle( DT_MONSTER_ENT03, pMonster:GetAngleToTarget() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽었음
function Ent_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= 26 and iFrame < 51 ) then
		pMonster:PlaySound(210)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Ent_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:PlaySound(209)
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )

    end
end

--  스톤커스 걸렸음
function Ent_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:SetPushCheck( false )
        pMonster:AddTraceParticle( "StoneCurse_medium", 3 )
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  아이스커스 걸렸음
function Ent_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_middle_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_middle_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_middle_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_middle_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end


-- 홀드 걸렸음(이펙트)
function Ent_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Middle", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------
function Ent_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -800, 600, 800, -100 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Ent_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Ent_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 600, 500, -500 ) == true ) then
			pMonster:TurnToTarget()
            pMonster:SetState( "WALK" )
            pMonster:ResetDelay()
    end
end

function Ent_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Ent_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 150, 100, -150 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Ent_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -300, 400, 300, -100 ) == true ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Ent_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 500, -200, 600, 200, -100 ) == true ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnEnt_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

function OnEnt_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:SetState( "DIE" )
	end
end

function OnEnt_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetPushCheck( true )
    pMonster:SetNoCheckContact(0)
    pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
    pMonster:SetSpeedY( 0.0 )
end

function Ent_MoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    --pMonster:SetSpeedX( pMonster:GetSpeedX() * -1 )
    --pMonster:SetState( "WALK" )

    pMonster:SetSpeedX( 0.0 )
    pMonster:SetState( "WAIT" )
end