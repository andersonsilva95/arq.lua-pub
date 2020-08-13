-- AI_AncientEnt.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "AncientEnt_Wait.frm",
        Func    = "AncientEnt_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "AncientEnt_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향하여 돌기
            {
                AICheckFrame        = 45,
                AIFunc              = "AncientEnt_Check_TurnToTarget",
                DelayFrame          = 90,
            },
            -- 걷기
            {
                AICheckFrame        = 55,
                AIFunc              = "AncientEnt_Check_Walk",
                DelayFrame          = 110,
            },
            -- 근접공격
            {
                AICheckFrame        = 75,
                AIFunc              = "AncientEnt_Check_Attack01",
                DelayFrame          = 220,
            },
            -- 바위던지기
            {
                AICheckFrame        = 110,
                AIFunc              = "AncientEnt_Check_Attack03",
                DelayFrame          = 165,
            },
			-- 나무줄기공격
            {
                AICheckFrame        = 110,
                AIFunc              = "AncientEnt_Check_Attack04",
                DelayFrame          = 330,
            },
			-- 다크브레스
            {
                AICheckFrame        = 55,
                AIFunc              = "AncientEnt_Check_Attack05",
                DelayFrame          = 440,
            },
			-- 엔트소환
            {
                AICheckFrame        = 300,
                AIFunc              = "AncientEnt_Check_Attack06",
                DelayFrame          = 1500,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "AncientEnt_Walk.frm",
        Func    = "AncientEnt_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "AncientEnt_MoveFail",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "AncientEnt_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향하여 돌기
            {
                AICheckFrame        = 25,
                AIFunc              = "AncientEnt_Check_TurnToTarget",
                DelayFrame          = 75,
            }, 
			-- 근접공격
            {
                AICheckFrame        = 110,
                AIFunc              = "AncientEnt_Check_Attack01",
                DelayFrame          = 220,
            },
			-- 바위던지기
            {
                AICheckFrame        = 110,
                AIFunc              = "AncientEnt_Check_Attack03",
                DelayFrame          = 165,
            },
            -- 멈추기
            {
                AICheckFrame        = 55,
                AIFunc              = "AncientEnt_Check_Stop",
                DelayFrame          = 110,
            },
        }
    },

    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "AncientEnt_Attack01.frm",
        Func    = "AncientEnt_Attack01Func",
    },

    -- 지진공격
    {
        ID      = "ATTACK02",
        Motion  = "AncientEnt_Attack02.frm",
        Func    = "AncientEnt_Attack02Func",
    },
    
    -- 바위던지기
    {
        ID      = "ATTACK03",
        Motion  = "AncientEnt_Attack03.frm",
        Func    = "AncientEnt_Attack03Func",
    },
	
	-- 나무줄기 공격
    {
        ID      = "ATTACK04",
        Motion  = "AncientEnt_Attack04.frm",
        Func    = "AncientEnt_Attack04Func",
    },
	
	-- 다크브레스
    {
        ID      = "ATTACK05",
        Motion  = "AncientEnt_Attack05.frm",
        Func    = "AncientEnt_Attack05Func",
    },
	
	-- 엔트소환
    {
        ID      = "ATTACK06",
        Motion  = "AncientEnt_Attack06.frm",
        Func    = "AncientEnt_Attack06Func",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "AncientEnt_DamageUp.frm",
        Func    = "AncientEnt_DamageFunc",
    },
	
	-- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "AncientEnt_Damage.frm",
        Func    = "AncientEnt_DamageFunc",
    },
    
    -- 큰 데미지 
    {
        ID      = "DAMAGE_SPECIAL",
        Motion  = "AncientEnt_Damage_Special.frm",
        Func    = "AncientEnt_DamageFunc",
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "AncientEnt_Die.frm",
        Func    = "AncientEnt_DieFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "AncientEnt_Stone.frm",
        Func    = "AncientEnt_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "AncientEnt_Stone.frm",
        Func    = "AncientEnt_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "AncientEnt_Stone.frm",
		Func	= "AncientEnt_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnAncientEnt_Land",
    Die     = "OnAncientEnt_Die",
    Damage  = "OnAncientEnt_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitAncientEnt( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_SPECIAL" )
    
	pMonster:RegistReaction( ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
	
	pMonster:RegisterSummonMonsterType( MON_ENTMINIMI )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function AncientEnt_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function AncientEnt_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= 11 and iFrame < 47 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	elseif( iFrame == 47 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:PlaySound(282)
	elseif( iFrame >= 61 and iFrame < 94 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:PlaySound(282)
        pMonster:SetState( "WALK" )
    end
end

-- 근접공격 상태
function AncientEnt_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif(iFrame == 71 )then
		pMonster:PlaySound( "244" )
		pMonster:AddDamage( DT_ANCIENT_ENT_ATTACK01 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 지진공격 상태
function AncientEnt_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:StartText("JUMP")
	elseif( iFrame == 41 ) then
		pMonster:SkillReadyEffectNoStop( 100, 200, 100, 0.0 )
	elseif( iFrame == 66 ) then
		pMonster:AddDamage( DT_ANCIENT_ENT_ATTACK02 )
	elseif( iFrame == 71 ) then
		pMonster:EarthQuake( 30, 0.06, 0.03 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 바위던지기 상태
function AncientEnt_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 85 ) then
        pMonster:ComputeAngleToTarget( 0.0, 0.6 ) -- 타겟으로의 각도를 계산
	elseif( iFrame == 121 ) then
        pMonster:AddDamageWithAngle( DT_ANCIENT_ENT_ATTACK03, pMonster:GetAngleToTarget() )
		pMonster:PlaySound( "244" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 땅파기공격 상태
function AncientEnt_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:StartText("JUMP")
	elseif( iFrame == 71 ) then
		pMonster:PlaySound( "47" )
		pMonster:AddDamageWithLocate( DT_ENT_LAND, 0.55, 0.0 )
		pMonster:AddDamageWithLocate( DT_ENT_LAND_SMOKE, 0.55, 0.0 )
		pMonster:EarthQuake( 19, 0.0, 0.0 )
	-- 10프레임 사이에 땅에 붙어있으면 줄기에 잡힌다..
	elseif( iFrame == 73 ) then
		-- 줄기가 튀어나오는 연출을 하기 위해.. 함수에 두번째 파라메터가 true이면 줄기 튀어나오는 이펙트 나온다
		pMonster:FreezeAttack( -0.01, true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 다크브레스 상태
function AncientEnt_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:StartText("DANGER")
		pMonster:PlaySound( "129" )
	elseif( iFrame == 71 ) then
		pMonster:SkillReadyEffectNoStop( 100, 200, 100, 0.0 )
	elseif( iFrame >= 121 and iFrame < 176 ) then
		if( iFrame == 121 ) then
			pMonster:PlaySound( "27" )
		
			if ( pMonster:GetIsRight() == true ) then
				pMonster:AddParticleNoDirection( "Tree_Bress_01_R", 0.3, 0.36 )
				pMonster:AddParticleNoDirection( "Tree_Bress_02_R", 0.3, 0.36 )
				pMonster:AddParticleNoDirection( "Tree_Bress_03_R", 0.3, 0.36 )
				pMonster:AddParticleNoDirection( "Tree_Bress_04_R", 0.3, 0.36 )
				pMonster:AddParticleNoDirection( "Tree_Bress_wave_01_R", 0.3, 0.36 )
				pMonster:AddParticleNoDirection( "Tree_Bress_wave_02_R", 0.3, 0.36 )
			else
				pMonster:AddParticleNoDirection( "Tree_Bress_01_L", -0.33, 0.36 )
				pMonster:AddParticleNoDirection( "Tree_Bress_02_L", -0.33, 0.36 )
				pMonster:AddParticleNoDirection( "Tree_Bress_03_L", -0.33, 0.36 )
				pMonster:AddParticleNoDirection( "Tree_Bress_04_L", -0.33, 0.36 )
				pMonster:AddParticleNoDirection( "Tree_Bress_wave_01_L", -0.33, 0.36 )
				pMonster:AddParticleNoDirection( "Tree_Bress_wave_02_L", -0.33, 0.36 )
			end			
		end
		
		if( math.mod( iFrame, 8 ) == 0 ) then
			pMonster:AddDamage( DT_ANCIENT_ENT_ATTACK05 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 엔트소환
function AncientEnt_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif(iFrame == 34 ) then
		pMonster:PlaySound( "281" )
		
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_ENTMINIMI
        pMon.fX = -150
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_ENTMINIMI
        pMon.fX = 150
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 죽었음
function AncientEnt_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound(210)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        --pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function AncientEnt_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 1 ) then
		pMonster:PlaySound(209)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )

    end
end

--  스톤커스 걸렸음
function AncientEnt_StoneCurseFunc( iMonsterIndex, iFrame )
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
function AncientEnt_IceCurseFunc( iMonsterIndex, iFrame )
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
function AncientEnt_HoldFunc( iMonsterIndex, iFrame )
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
function AncientEnt_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -800, 600, 800, -100 ) == true ) then
        pMonster:ResetDelay()
    end
end

function AncientEnt_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function AncientEnt_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 600, 500, -500 ) == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
			pMonster:TurnToTarget()
            pMonster:SetState( "WALK" )
            pMonster:ResetDelay()
    end
end

function AncientEnt_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function AncientEnt_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 250, 150, -150 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function AncientEnt_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -300, 400, 300, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function AncientEnt_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 500, -400, 600, 400, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function AncientEnt_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end


function AncientEnt_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 500, -300, 270, 300, -100 ) == true and pMonster:GetCountValue() >= 5 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end


function AncientEnt_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSummonedMonsterCount() < 1 ) then
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnAncientEnt_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

function OnAncientEnt_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:SetState( "DIE" )
	end
end

function OnAncientEnt_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetPushCheck( true )
    pMonster:SetNoCheckContact(0)
    pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
    pMonster:SetSpeedY( 0.0 )

	if( pMonster:CheckState( "DAMAGE_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false and pMonster:CheckState( "HOLD" ) == false ) then
		if( pMonster:FloatRand() < 0.1 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false ) then
			pMonster:AddCountValue(1)			
			if( pMonster:FloatRand() < 0.5 and pMonster:CheckTargetInRange( 0, -300, 270, 300, -200 ) == true ) then
				pMonster:TurnToTarget()					
				pMonster:SetState( "ATTACK01" )
				pMonster:SetSuperArmor(true)
			else
				pMonster:SetState( "ATTACK02" )
			end		
		end
	end
	
end

function AncientEnt_MoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    --pMonster:SetSpeedX( pMonster:GetSpeedX() * -1 )
    --pMonster:SetState( "WALK" )

    pMonster:SetSpeedX( 0.0 )
    pMonster:SetState( "WAIT" )
end