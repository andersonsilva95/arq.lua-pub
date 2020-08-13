-- AI_DarkAmon.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Antoinette_Wait.frm",
        Func    = "Antoinette_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "Antoinette_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 80,
                AIFunc              = "Antoinette_Check_TurnToTarget",
                DelayFrame          = 80,
            },
            -- �ȱ�
            {
                AICheckFrame        = 110,
                AIFunc              = "Antoinette_Check_Walk",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 50,
                AIFunc              = "Antoinette_Check_Attack01",
                DelayFrame          = 200,
            },
            -- ��������
            {
                AICheckFrame        = 150,
                AIFunc              = "Antoinette_Check_Attack02",
                DelayFrame          = 250
            },
            -- ������극��
            {
                AICheckFrame        = 200,
                AIFunc              = "Antoinette_Check_Attack03",
                DelayFrame          = 1200,
            },
			-- ����Ĺ� ��ȯ
			{
				AICheckFrame        = 300,
                AIFunc              = "Antoinette_Check_Attack05",
                DelayFrame          = 2000,
			},
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Antoinette_Move.frm",
        Func    = "Antoinette_WalkFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 55,
                AIFunc              = "Antoinette_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 80,
                AIFunc              = "Antoinette_Check_TurnToTarget",
                DelayFrame          = 80,
            },
			-- ��������
            {
                AICheckFrame        = 100,
                AIFunc              = "Antoinette_Check_Attack01",
                DelayFrame          = 200,
            },
            -- ��������
            {
                AICheckFrame        = 150,
                AIFunc              = "Antoinette_Check_Attack02",
                DelayFrame          = 300,
            },
			-- ���߱�
            {
                AICheckFrame        = 5,
                AIFunc              = "Antoinette_Check_Stop",
                DelayFrame          = 10,
            },
        }
    },
    
    -- ����01
    {
        ID      = "ATTACK01",
        Motion  = "Antoinette_Attack01.frm",
        Func    = "Antoinette_Attack01Func",
    },

	-- ����02 ���� �غ�
	{
		ID	  = "ATTACK02READY",
		Motion  = "Antoinette_Attack02_ready.frm",
		Func	= "Antoinette_Attack02ReadyFunc",
	},
	
	-- ����02 ���� ����
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
	
	-- ����02 ���� ����
	{
		ID	  = "ATTACK02DOWN",
		Motion  = "Antoinette_Attack02_End.frm",
		Func	= "Antoinette_Attack02LandingFunc",
	},

    -- ����03 ������ ����Ʈ
    {
        ID      = "ATTACK03",
        Motion  = "Antoinette_Attack03.frm",
        Func    = "Antoinette_Attack03Func",
    },
    
    -- ����04 ���б�~
    {
        ID      = "ATTACK04",
        Motion  = "Antoinette_Attack04.frm",
        Func    = "Antoinette_Attack04Func",
    },
    
    -- ����Ĺ� ��ȯ
    {
        ID      = "ATTACK05",
        Motion  = "Antoinette_Attack05.frm",
        Func    = "Antoinette_Attack05Func",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Antoinette_Die.frm",
        Func    = "Antoinette_DieFunc",
    },
    
    -- �Ͼ�� ���¿���..
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
-- �ʱ�ȭ �Լ�
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
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Antoinette_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �ȱ� ����
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

-- �״»���
function Antoinette_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound(999068)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()        
    end
end

-- ������ ������
function Antoinette_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���� ����
function Antoinette_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- ���� ����
function Antoinette_LandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
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

--  �������� �غ� ����
function Antoinette_Attack02ReadyFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK02UP" )
	end
end

--  �������� ����&���� ����
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

--  �������� ���� ����
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

-- ������ ����Ʈ ����
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

--  ���б�
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

--  ����Ĺ� ��ȯ ����
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

-- 20% ������ ��
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
-- �����üũ
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
-- �ݹ� �Լ�
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