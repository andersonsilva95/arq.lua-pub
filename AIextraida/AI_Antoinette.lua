-- AI_DarkAmon.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Antoinette_Wait.frm",
        Func    = "Antoinette_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 55,
                AIFunc              = "Antoinette_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 80,
                AIFunc              = "Antoinette_Check_TurnToTarget",
                DelayFrame          = 80,
            },
            -- 걷기
            {
                AICheckFrame        = 110,
                AIFunc              = "Antoinette_Check_Walk",
                DelayFrame          = 110,
            },
            -- 근접공격
            {
                AICheckFrame        = 50,
                AIFunc              = "Antoinette_Check_Attack01",
                DelayFrame          = 200,
            },
            -- 지진공격
            {
                AICheckFrame        = 150,
                AIFunc              = "Antoinette_Check_Attack02",
                DelayFrame          = 250
            },
            -- 포이즌브레스
            {
                AICheckFrame        = 200,
                AIFunc              = "Antoinette_Check_Attack03",
                DelayFrame          = 1200,
            },
			-- 식충식물 소환
			{
				AICheckFrame        = 300,
                AIFunc              = "Antoinette_Check_Attack05",
                DelayFrame          = 2000,
			},
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Antoinette_Move.frm",
        Func    = "Antoinette_WalkFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 55,
                AIFunc              = "Antoinette_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 80,
                AIFunc              = "Antoinette_Check_TurnToTarget",
                DelayFrame          = 80,
            },
			-- 근접공격
            {
                AICheckFrame        = 100,
                AIFunc              = "Antoinette_Check_Attack01",
                DelayFrame          = 200,
            },
            -- 지진공격
            {
                AICheckFrame        = 150,
                AIFunc              = "Antoinette_Check_Attack02",
                DelayFrame          = 300,
            },
			-- 멈추기
            {
                AICheckFrame        = 5,
                AIFunc              = "Antoinette_Check_Stop",
                DelayFrame          = 10,
            },
        }
    },
    
    -- 공격01
    {
        ID      = "ATTACK01",
        Motion  = "Antoinette_Attack01.frm",
        Func    = "Antoinette_Attack01Func",
    },

	-- 공격02 지진 준비
	{
		ID	  = "ATTACK02READY",
		Motion  = "Antoinette_Attack02_ready.frm",
		Func	= "Antoinette_Attack02ReadyFunc",
	},
	
	-- 공격02 지진 도약
	{
		ID	  = "ATTACK02UP",
		Motion  = "Antoinette_Attack02_Attack.frm",
		Func	= "Antoinette_Attack02UpFunc",
		Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Antoinette_Check_Attack02_Target",
                DelayFrame          = 0,
            },
        }
	},
	
	-- 공격02 지진 착지
	{
		ID	  = "ATTACK02DOWN",
		Motion  = "Antoinette_Attack02_End.frm",
		Func	= "Antoinette_Attack02LandingFunc",
	},

    -- 공격03 포이즌 블래스트
    {
        ID      = "ATTACK03",
        Motion  = "Antoinette_Attack03.frm",
        Func    = "Antoinette_Attack03Func",
    },
    
    -- 공격04 몸털기~
    {
        ID      = "ATTACK04",
        Motion  = "Antoinette_Attack04.frm",
        Func    = "Antoinette_Attack04Func",
    },
    
    -- 식충식물 소환
    {
        ID      = "ATTACK05",
        Motion  = "Antoinette_Attack05.frm",
        Func    = "Antoinette_Attack05Func",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Antoinette_Die.frm",
        Func    = "Antoinette_DieFunc",
    },
    
    -- 하얗게 불태웠어..
    {
        ID      = "APPA",
        Motion  = "Antoinette_Damaged.frm",
        Func    = "Antoinette_DamagedFunc",
    },
}

CallBack =
{
    Die     = "OnAntoinette_Die",
    Damage  = "OnAntoinette_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitAntoinette( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
--[[
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
--]]
	pMonster:RegisterSummonMonsterType( MON_PLANT_MINI )
	pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Antoinette_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function Antoinette_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame == 21 ) then
		pMonster:PlaySound(999016)
    elseif( iFrame == 41 ) then
		pMonster:PlaySound(999016)
    elseif( iFrame == 61 ) then
		pMonster:PlaySound(999016)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:PlaySound(999016)
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function Antoinette_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound(999068)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()        
    end
end

-- 데미지 입은거
function Antoinette_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 점프 상태
function Antoinette_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 착지 상태
function Antoinette_LandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Antoinette_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 24 ) then
        --pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
    elseif( iFrame == 35 ) then
		pMonster:PlaySound(999017)
	elseif( iFrame == 40 ) then
		pMonster:StartAttack( 5, PAR_BIG_DAMAGE,0.3, 58, 62, 7)
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(999017)
	elseif( iFrame == 65 ) then
		pMonster:StartAttack( 3, PAR_DOWN,0.2, 46, 50, 7)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  지진공격 준비 상태
function Antoinette_Attack02ReadyFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK02UP" )
	end
end

--  지진공격 도약&강하 상태
function Antoinette_Attack02UpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:GetSpeedY() >= 2.5 ) then
		pMonster:SetSpeedY( 0.0 )
	end
	
	if( iFrame >= 45 and pMonster:IsLastBottom() == true ) then
	    pMonster:SetState( "ATTACK02DOWN" )
    end
	
	if( iFrame == 1 ) then
		pMonster:SetSuperArmor( true ) 
        pMonster:SetSpeedY( 0.1 )
        pMonster:StartText("JUMP")
	elseif( iFrame == 45 ) then
	    pMonster:SetSuperArmor( true ) 
		pMonster:SetSpeedY( -0.15 )
		pMonster:SetNoCheckContact(110)
        pMonster:SetIgnoreFHCheck(false)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
		pMonster:SetState( "ATTACK02DOWN" )
	end
end

--  지진공격 착지 상태
function Antoinette_Attack02LandingFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 0 ) then
		pMonster:SetFrameLock( false )
	elseif( iFrame == 1 ) then
		pMonster:EarthQuake( 30, 0.06, 0.03 ) 
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- 포이즌 블래스트 상태
function Antoinette_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 56 ) then
	    pMonster:SkillReadyEffectNoStop( 100, 100, 255, 0.0 )
    elseif( iFrame == 61 ) then
	    pMonster:PlaySound(999021)
    elseif( iFrame == 63 ) then
        pMonster:AddDamage( DT_ANTOINETTE_POISON_LAY )
        if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Antoinette_Smoke_01_R", 0.55, 0.55 )
        else
			pMonster:AddParticleNoDirection( "Antoinette_Smoke_01", -0.55, 0.55 )
        end
        
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  몸털기
function Antoinette_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 0 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 37 ) then
		pMonster:PlaySound(999023)
		pMonster:AddDamage( DT_ANTOINETTE_VIB )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  식충식물 소환 상태
function Antoinette_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 17 ) then
		pMonster:PlaySound(999018)
	elseif( iFrame == 70 ) then
		pMonster:PlaySound(999019)
    elseif( iFrame == 74 ) then
		pMonster:PlaySound(999020)
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_PLANT_MINI
        pMon.fX = -100
        pMon.fY = 100
        pMonster:SummonMonster( pMon )
    elseif( iFrame == 106 ) then
		pMonster:PlaySound(999019)
    elseif( iFrame == 108 ) then
		pMonster:PlaySound(999020)
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_PLANT_MINI
		pMon.fX = -10
        pMon.fY = 100
        pMonster:SummonMonster( pMon )
    elseif( iFrame == 150 ) then
		pMonster:PlaySound(999019)
    elseif( iFrame == 153 ) then
		pMonster:PlaySound(999020)
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_PLANT_MINI
		pMon.fX = 100
        pMon.fY = 100
        pMonster:SummonMonster( pMon )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 20% 아프다 ㅠ
function Antoinette_DamagedFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    end
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Antoinette_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Antoinette_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Antoinette_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 190, -200, 500, 200, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Antoinette_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -200, 3000, 200, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Antoinette_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -200, 400, 200, -200 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Antoinette_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 350, -250, 250, 250, -350 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Antoinette_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetSummonedMonsterCount() < 1 and pMonster:GetX() >= 0.5 and pMonster:GetX() <= 2.1 ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Antoinette_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--if( pMonster:IsTarget() == true ) then
	if( pMonster:CheckTargetInRange( 100, -300, 600, 300, 400 ) == true ) then
		pMonster:SetState( "ATTACK02READY" )
		pMonster:ResetDelay()
	end
end

function OnAntoinette_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnAntoinette_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false )
	
	if( pMonster:GetHP() < pMonster:GetMaxHP() * 0.75 and pMonster:GetCountValue() == 0 ) then
	    pMonster:SetInvincible( true )
	    pMonster:SetState( "APPA" )
	    pMonster:AddCountValue(1)
	else
		if ( pMonster:FloatRand() < 0.05 and pMonster:IsSuperArmor() == false ) then
			pMonster:SetSuperArmor(true)
			pMonster:TurnToTarget()
			if ( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK02READY" )
			else
				pMonster:SetState( "ATTACK04" )
			end
		end
	end
	
end