-- AI_DeteriorationEnt.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "DeteriorationEnt_Wait.frm",
        Func    = "DeteriorationEnt_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "DeteriorationEnt_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향하여 돌기
            {
                AICheckFrame        = 45,
                AIFunc              = "DeteriorationEnt_Check_TurnToTarget",
                DelayFrame          = 90,
            },
            -- 걷기
            {
                AICheckFrame        = 55,
                AIFunc              = "DeteriorationEnt_Check_Walk",
                DelayFrame          = 110,
            },
            -- 2단공격
            {
                AICheckFrame        = 55,
                AIFunc              = "DeteriorationEnt_Check_Attack01",
                DelayFrame          = 220,
            },
            -- 땅파기공격
            {
                AICheckFrame        = 110,
                AIFunc              = "DeteriorationEnt_Check_Attack02",
                DelayFrame          = 550,
            },
            -- 나뭇가지던지기
            {
                AICheckFrame        = 110,
                AIFunc              = "DeteriorationEnt_Check_Attack03",
                DelayFrame          = 110,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "DeteriorationEnt_Walk.frm",
        Func    = "DeteriorationEnt_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "DeteriorationEnt_MoveFail",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "DeteriorationEnt_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향하여 돌기
            {
                AICheckFrame        = 25,
                AIFunc              = "DeteriorationEnt_Check_TurnToTarget",
                DelayFrame          = 75,
            },  
            -- 2단공격
            {
                AICheckFrame        = 75,
                AIFunc              = "DeteriorationEnt_Check_Attack01",
                DelayFrame          = 110,
            },			
            -- 사과던지기
            {
                AICheckFrame        = 55,
                AIFunc              = "DeteriorationEnt_Check_Attack03",
                DelayFrame          = 110,
            },
            -- 멈추기
            {
                AICheckFrame        = 55,
                AIFunc              = "DeteriorationEnt_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },

    -- 2단공격
    {
        ID      = "ATTACK01",
        Motion  = "DeteriorationEnt_Attack01.frm",
        Func    = "DeteriorationEnt_Attack01Func",
    },

    -- 땅파기공격
    {
        ID      = "ATTACK02",
        Motion  = "DeteriorationEnt_Attack02.frm",
        Func    = "DeteriorationEnt_Attack02Func",
    },
    
    -- 나뭇가지던지기
    {
        ID      = "ATTACK03",
        Motion  = "DeteriorationEnt_Attack03.frm",
        Func    = "DeteriorationEnt_Attack03Func",
    },

    -- 데미지 상,중
    {
        ID      = "DAMAGE_UP",
        Motion  = "DeteriorationEnt_Damage_Up.frm",
        Func    = "DeteriorationEnt_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "DeteriorationEnt_Damage_Down.frm",
        Func    = "DeteriorationEnt_DamageFunc",
    },
    
    -- 큰 데미지 
    {
        ID      = "DAMAGE_BIG",
        Motion  = "DeteriorationEnt_Damage_Special.frm",
        Func    = "DeteriorationEnt_DamageFunc",
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "DeteriorationEnt_Die.frm",
        Func    = "DeteriorationEnt_DieFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "DeteriorationEnt_Stone.frm",
        Func    = "DeteriorationEnt_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "DeteriorationEnt_Stone.frm",
        Func    = "DeteriorationEnt_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "DeteriorationEnt_Stone.frm",
		Func	= "DeteriorationEnt_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnDeteriorationEnt_Land",
    Die     = "OnDeteriorationEnt_Die",
    Damage  = "OnDeteriorationEnt_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitDeteriorationEnt( iMonsterIndex )
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
function DeteriorationEnt_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function DeteriorationEnt_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= 16 and iFrame < 51 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	elseif( iFrame == 55 ) then
		pMonster:PlaySound(282)
	elseif( iFrame >= 71 and iFrame < 106 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	elseif( iFrame == 106 ) then
		pMonster:PlaySound(282)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end

end

-- 2단공격 상태
function DeteriorationEnt_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 61 )then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
	elseif( iFrame == 64 )then
		pMonster:AddDamage( DT_MONSTER_ENT01 )
	elseif( iFrame == 128 )then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
	elseif( iFrame == 131 )then
		pMonster:AddDamage( DT_MONSTER_ENT02 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 땅파기공격 상태
function DeteriorationEnt_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	    pMonster:StartText( "JUMP" )
    elseif( iFrame == 33 ) then
		pMonster:SkillReadyEffectNoStop( 100, 200, 100, 0.0 )
	elseif( iFrame == 52 ) then
		pMonster:AddDamageWithLocate( DT_ENT_LAND, 0.5, 0.0 )
		pMonster:AddDamageWithLocate( DT_ENT_LAND_SMOKE, 0.5, 0.0 )
		pMonster:EarthQuake( 19, 0.0, 0.0 )
	-- 10프레임 사이에 땅에 붙어있으면 줄기에 잡힌다..
	elseif( iFrame >= 56 and iFrame <= 61 ) then
        if( iFrame == 57 ) then
            -- 줄기가 튀어나오는 연출을 하기 위해.. 함수에 두번째 파라메터가 true이면 줄기 튀어나오는 이펙트 나온다
            pMonster:FreezeAttack( -0.01, true )
        else
            pMonster:FreezeAttack( -0.01, false )
        end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 나뭇가지던지기 상태
function DeteriorationEnt_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 63 ) then
        pMonster:ComputeAngleToTarget( 0.0, 0.6 ) -- 타겟으로의 각도를 계산
    elseif( iFrame == 113 ) then
        pMonster:AddDamageWithAngle( DT_DETERIORATION_ENT_ATTACK01, pMonster:GetAngleToTarget() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽었음
function DeteriorationEnt_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 26 ) then
		pMonster:PlaySound(210)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function DeteriorationEnt_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 1) then
		pMonster:PlaySound(209)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )

    end
end

--  스톤커스 걸렸음
function DeteriorationEnt_StoneCurseFunc( iMonsterIndex, iFrame )
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
function DeteriorationEnt_IceCurseFunc( iMonsterIndex, iFrame )
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
function DeteriorationEnt_HoldFunc( iMonsterIndex, iFrame )
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
function DeteriorationEnt_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -800, 600, 800, -100 ) == true ) then
        pMonster:ResetDelay()
    end
end

function DeteriorationEnt_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function DeteriorationEnt_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 600, 500, -500 ) == true and pMonster:CheckTargetInRange( 150, -150, 200, 150, -100 ) == false ) then
			pMonster:TurnToTarget()
            pMonster:SetState( "WALK" )
            pMonster:ResetDelay()
    end
end

function DeteriorationEnt_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function DeteriorationEnt_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 150, 100, -150 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function DeteriorationEnt_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function DeteriorationEnt_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 400, -200, 600, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnDeteriorationEnt_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

function OnDeteriorationEnt_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:SetState( "DIE" )
	end
end

function OnDeteriorationEnt_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetPushCheck( true )
    pMonster:SetNoCheckContact(0)
    pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
    pMonster:SetSpeedY( 0.0 )
	
	if( pMonster:FloatRand() < 0.05 ) then
		if( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK02" )
			pMonster:SetSuperArmor( true )
		elseif( pMonster:CheckTargetInRange( 100, -100, 150, 100, -150 ) == true ) then
			pMonster:SetState( "ATTACK01" )
			pMonster:SetSuperArmor( true )
		end
	end
end

function DeteriorationEnt_MoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    --pMonster:SetSpeedX( pMonster:GetSpeedX() * -1 )
    --pMonster:SetState( "WALK" )

    pMonster:SetSpeedX( 0.0 )
    pMonster:SetState( "WAIT" )
end