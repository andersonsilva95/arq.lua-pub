-- AI_vulcanus.lua

ActionList =
{	
	-- ���
	{
		ID	= "WAIT",
		Motion  = "vulcanus_Wait.frm",
		Func	= "vulcanus_WaitFunc",

		Trigger =
		{
			-- Ÿ����
			{
				AICheckFrame		= 10,
				AIFunc			= "vulcanus_Check_Targeting",
				DelayFrame		= 20,
			},

			-- Ÿ���� ���� ��
			{
				AICheckFrame		= 10,
				AIFunc			= "vulcanus_Check_TurnToTarget",
				DelayFrame		= 10,
			},

			-- �޸���
			{
				AICheckFrame	= 35,
				AIFunc			= "vulcanus_Check_Run",
				DelayFrame		= 130,
			},
			
			-- �ڷ���Ʈ(Ÿ�ٿ��Է�)
            {
                AICheckFrame        = 144,
                AIFunc              = "vulcanus_Check_Teleport",
                DelayFrame          = 333,
            },
			
			-- ����� 1��
            {
                AICheckFrame        = 150,
				AICheckFrame1       = 150,
				AICheckFrame2       = 50,
                AIFunc              = "vulcanus_Check_Attack01",
                DelayFrame          = 200,
				DelayFrame1         = 200,
				DelayFrame1         = 100,
            },
			
			-- ����� 2��
            {
                AICheckFrame        = 150,
				AICheckFrame1       = 150,
				AICheckFrame2       = 100,
                AIFunc              = "vulcanus_Check_Attack02",
                DelayFrame          = 200,
				DelayFrame1         = 200,
				DelayFrame1         = 100,
            },
			
			-- ������
            {
                AICheckFrame        = 340,
				AICheckFrame1       = 240,
				AICheckFrame2       = 140,
                AIFunc              = "vulcanus_Check_Attack03",
                DelayFrame          = 450,
				DelayFrame1         = 250,
				DelayFrame2         = 150,
            },

			-- ��� �ĵ�
            {
                AICheckFrame       = 800,
				AICheckFrame1      = 800,
				AICheckFrame2      = 400,
                AIFunc              = "vulcanus_Check_Attack05",
                DelayFrame         = 2000,
				DelayFrame1        = 1200,
				DelayFrame2        = 800,
            },
			
			-- ȭ�� ����
            {
                AICheckFrame       = 340,
				AICheckFrame1      = 150,
				AICheckFrame2      = 70,
                AIFunc              = "vulcanus_Check_Attack06",
                DelayFrame         = 300,
				DelayFrame1        = 300,
				DelayFrame2        = 100,
            },
			
			-- �������� ��ȯ
            {
                AICheckFrame       = 1000,
				AICheckFrame1      = 900,
				AICheckFrame2      = 600,
                AIFunc              = "vulcanus_Check_Attack10",
                DelayFrame         = 2000,
				DelayFrame1        = 1000,
				DelayFrame2        = 800,
            },
			
			-- �������ܺ� ��ȯ(2������)
            {
                AICheckFrame       = 1500,
				AICheckFrame1      = 1000,
				AICheckFrame2      = 500,
                AIFunc              = "vulcanus_Check_Attack04",
                DelayFrame         = 5000,
				DelayFrame1        = 3000,
				DelayFrame2        = 1000,
            },
			
			-- ���¢�� ��ȥ(2������)
			{
                AICheckFrame       = 700,
				AICheckFrame1      = 500,
				AICheckFrame2      = 80,				
                AIFunc              = "vulcanus_Check_Attack07",
                DelayFrame         = 300,
				DelayFrame1        = 200,
				DelayFrame2        = 100,
            },
			
			-- ����ȭ(4������)
			{
                AICheckFrame       = 500,
				AICheckFrame1      = 300,
				AICheckFrame2      = 300,
                AIFunc              = "vulcanus_Check_Attack08",
                DelayFrame         = 1300,
				DelayFrame1        = 1000,
				DelayFrame2        = 700,
            },
			
			-- ȭ�� ������(4������)
			{
                AICheckFrame       = 340,
				AICheckFrame1      = 150,
				AICheckFrame2      = 100,
                AIFunc              = "vulcanus_Check_Attack06",
                DelayFrame         = 300,
				DelayFrame1        = 300,
				DelayFrame2        = 100,
            },
		},
	},
	
	--  �޸���
	{
		ID	= "RUN",
		Motion  = "vulcanus_Move.frm",
		Func	= "vulcanus_RunFunc",

		Trigger =
		{
			-- Ÿ���� ���� ��
			{
				AICheckFrame		= 35,
				AIFunc				= "vulcanus_Check_TurnToTarget",
				DelayFrame			= 10,
			},
			-- ���߱�
			{
				AICheckFrame		= 10,
				AIFunc				= "vulcanus_Check_RunStop",
				DelayFrame			= 40,
			},
			
			-- �ڷ���Ʈ(Ÿ�ٿ��Է�)
            {
                AICheckFrame        = 144,
                AIFunc              = "vulcanus_Check_Teleport",
                DelayFrame          = 333,
            },
			
			-- ȭ�� ����
            {
                AICheckFrame       = 340,
				AICheckFrame1      = 150,
				AICheckFrame2      = 70,
                AIFunc              = "vulcanus_Check_Attack06",
                DelayFrame         = 300,
				DelayFrame1        = 300,
				DelayFrame2        = 100,
            },
		}
	},
	
	-- �ױ�02
	{
		ID	= "DIE_LANDING",
		Motion  = "vulcanus_Die.frm",
		Func	= "vulcanus_DieFunc",
	},
	
	-- ����� 1��
	{
		ID	= "ATTACK01",
		Motion  = "vulcanus_Attack01.frm",
		Func	= "vulcanus_Attack01Func",
	},
	
	-- ����� 2��
	{
		ID	= "ATTACK02",
		Motion  = "vulcanus_Attack02.frm",
		Func	= "vulcanus_Attack02Func",
	},
	
	-- ������
	{
		ID	= "ATTACK03",
		Motion  = "vulcanus_Attack03.frm",
		Func	= "vulcanus_Attack03Func",
	},
	
	-- ���� ���ܺ� 2����(���̵� 1)(2������)
	{
		ID	= "ATTACK04_1",
		Motion  = "vulcanus_Attack04.frm",
		Func	= "vulcanus_Attack04_1Func",
	},
	
	-- �������ܺ� ��ȯ 3����(���̵� 2)(2������)
	{
		ID	= "ATTACK04_2",
		Motion  = "vulcanus_Attack04.frm",
		Func	= "vulcanus_Attack04_2Func",
	},
	
	-- �������ܺ� ��ȯ 4����(���̵� 3)(2������)
	{
		ID	= "ATTACK04_3",
		Motion  = "vulcanus_Attack04.frm",
		Func	= "vulcanus_Attack04_3Func",
	},
	
	-- ��� �ĵ�
	{
		ID	= "ATTACK05",
		Motion  = "vulcanus_Attack05.frm",
		Func	= "vulcanus_Attack05Func",
	},
	
	-- ȭ�� ����
	{
		ID	= "ATTACK06",
		Motion  = "vulcanus_Attack06.frm",
		Func	= "vulcanus_Attack06Func",
	},
	
	-- ���¢�� ��ȥ(2������)
	{
		ID	= "ATTACK07",
		Motion  = "vulcanus_Attack07.frm",
		Func	= "vulcanus_Attack07Func",
	},
	
	-- ����ȭ(4������)
	{
		ID	= "ATTACK08",
		Motion  = "vulcanus_Attack08.frm",
		Func	= "vulcanus_Attack08",
	},
	
	-- ȭ�� ������(4������)
	{
		ID	= "ATTACK09",
		Motion  = "vulcanus_Attack09.frm",
		Func	= "vulcanus_Attack09",
	},
	
	-- ���� ���� ��ȯ 1����
	{
		ID	= "ATTACK10_1",
		Motion  = "vulcanus_Attack04.frm",
		Func	= "vulcanus_Attack10_1Func",
	},
	
	-- ���� ���� ��ȯ 3����
	{
		ID	= "ATTACK10_2",
		Motion  = "vulcanus_Attack04.frm",
		Func	= "vulcanus_Attack10_2Func",
	},
	
	-- ���� ���� ��ȯ 4����
	{
		ID	= "ATTACK10_3",
		Motion  = "vulcanus_Attack04.frm",
		Func	= "vulcanus_Attack10_3Func",
	},
	
	-- �ڷ���Ʈ
    {
        ID      = "TELEPORT",
        Motion  = "vulcanus_wait.frm",
        Func    = "vulcanus_TeleportFunc",
        
        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 10,
                AIFunc              = "vulcanus_Check_TeleportLanding",
                DelayFrame          = 10,
            },
        }
    },
    
    -- �ڷ���Ʈ ����
    {
        ID      = "TELEPORT_LANDING",
        Motion  = "vulcanus_wait.frm",
        Func    = "vulcanus_TeleportLandingFunc",
    },
}

CallBack =
{
	Land	= "Onvulcanus_Land",
	Die	= "Onvulcanus_Die",
	Damage  = "Onvulcanus_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function Initvulcanus( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:AddTraceParticleToBone( "Vulcanus_Hair_01", 1.0, 5, 6, 8 )
	pMonster:AddTraceParticleToBone( "Vulcanus_Hair_02", 1.0, 5, 5, 7 )
	pMonster:AddTraceParticleToBone( "Vulcanus_Hair_03", 1.0, 5, 6, 8 )
	pMonster:AddTraceParticleToBone( "Vulcanus_Middle", 1.0,10, 7, 7 )
	pMonster:AddTraceParticleToBone( "Vulcanus_Middle", 1.0,18, 7, 7 )
	pMonster:AddTraceParticleToBone( "Vulcanus_Middle", 1.0, 4, 7, 7 )
	
	pMonster:RegisterSummonMonsterType( MON_HELL_PREIST )
	pMonster:RegisterSummonMonsterType( MON_HELL_HAMMERMON )
	
	local pMon
	for i = 0, 11 do
		pMon = g_MyD3D:GetMonster(i)
		pMon:SetState( "DIE_FIRST" )
    end
	
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function vulcanus_WaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:ToggleRender( true )
	pMonster:SetPushCheck( true )
	
	--g_kCamera.WideMode = 8
	if( iFrame == 1 ) then
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
		pMonster:SetPushCheck( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		if(pMonster:IsSuperArmor() == true) then
			pMonster:SetSuperArmor( false )
		end
		
		pMonster:SetState( "WAIT" )   
		g_kCamera.WideMode = 9	
	end
end

-- �޸��� ����
function vulcanus_RunFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetRunSpeed() )
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "RUN" )
	end
end

-- �״»���
function vulcanus_DieFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(998022)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
		pMonster:SetFrameLock( true )
	end
end

-- ������ ������
function vulcanus_DamageFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
	--pMonster:PlaySound(1036)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function vulcanus_ToWaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function vulcanus_Attack01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 62 ) then
		pMonster:PlaySound(985023)
		pMonster:AddDamage(DT_HELL_VULCANUS_ATK1)
		
		local posX = 0.9
		local posY = 0.15
		if( false == pMonster:GetIsRight() ) then
			--posX = -1.0 * posX
		end
		
		pMonster:AddParticle( "Vulcanus_Crash_01", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_02", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_03", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_04", posX, posY )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function vulcanus_Attack02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 62 ) then
		pMonster:PlaySound(985023)
		pMonster:AddDamage(DT_HELL_VULCANUS_ATK1)
		local posX = 0.9
		local posY = 0.15
		if( false == pMonster:GetIsRight() ) then
			--posX = -1.0 * posX
		end
		
		pMonster:AddParticle( "Vulcanus_Crash_01", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_02", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_03", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_04", posX, posY )
	elseif( iFrame == 85 ) then
		pMonster:PlaySound(985024)
		pMonster:AddDamage(DT_HELL_VULCANUS_ATK1)
		local posX = 0.9
		local posY = 0.15
		if( false == pMonster:GetIsRight() ) then
			--posX = -1.0 * posX
		end
		
		pMonster:AddParticle( "Vulcanus_Crash_01", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_02", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_03", posX, posY )
		pMonster:AddParticle( "Vulcanus_Crash_04", posX, posY )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function vulcanus_Attack03Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 35 ) then
		pMonster:PlaySound(985026)
		local posx = 0.2
		local posy = 0.5
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocate(DT_HELL_VULCANUS_ROCK, posx, posy )
		else
			pMonster:AddDamageWithLocate(DT_HELL_VULCANUS_ROCK_R, posx, posy )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function vulcanus_Attack04_1Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	 if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 75 ) then
		pMonster:PlaySound(985030)
		local posy = 0.0
		pMonster:AddParticle("Vulcanus_Circle_01", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Circle_02", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Circle_03", 0.0, posy)
		pMonster:AddParticle("Jin01_SP2-2_Finish_Burn_04", 0.0, 0.1)
		pMonster:AddParticle("Jin01_SP2-2_Finish_Burn_05", 0.0, 0.1)
		
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_HAMMERMON
    	pMon.fX = -350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_HAMMERMON
    	pMon.fX = 350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function vulcanus_Attack04_2Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	 if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 75 ) then
		pMonster:PlaySound(985030)
		local posy = 0.0
		pMonster:AddParticle("Vulcanus_Circle_01", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Circle_02", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Circle_03", 0.0, posy)
		pMonster:AddParticle("Jin01_SP2-2_Finish_Burn_04", 0.0, 0.1)
		pMonster:AddParticle("Jin01_SP2-2_Finish_Burn_05", 0.0, 0.1)
		
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_HAMMERMON
    	pMon.fX = -350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_HAMMERMON
    	pMon.fX = 350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_HAMMERMON
    	pMon.fX = 350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function vulcanus_Attack04_3Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	 if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 75 ) then
		pMonster:PlaySound(985030)
		local posy = 0.0
		pMonster:AddParticle("Vulcanus_Circle_01", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Circle_02", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Circle_03", 0.0, posy)
		pMonster:AddParticle("Jin01_SP2-2_Finish_Burn_04", 0.0, 0.1)
		pMonster:AddParticle("Jin01_SP2-2_Finish_Burn_05", 0.0, 0.1)
		
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_HAMMERMON
    	pMon.fX = -350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_HAMMERMON
    	pMon.fX = 350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_HAMMERMON
    	pMon.fX = 150
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_HAMMERMON
    	pMon.fX = -150
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


function vulcanus_Attack10_1Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	 if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 75 ) then
		pMonster:PlaySound(985030)
		local posy = 0.0
		pMonster:AddParticle("Vulcanus_Circle_01", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Circle_02", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Circle_03", 0.0, posy)
		pMonster:AddParticle("Jin01_SP2-2_Finish_Burn_04", 0.0, 0.1)
		pMonster:AddParticle("Jin01_SP2-2_Finish_Burn_05", 0.0, 0.1)
		
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_PREIST
    	pMon.fX = -350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function vulcanus_Attack10_2Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	 if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 75 ) then
		pMonster:PlaySound(985030)
		local posy = 0.0
		pMonster:AddParticle("Vulcanus_Circle_01", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Circle_02", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Circle_03", 0.0, posy)
		pMonster:AddParticle("Jin01_SP2-2_Finish_Burn_04", 0.0, 0.1)
		pMonster:AddParticle("Jin01_SP2-2_Finish_Burn_05", 0.0, 0.1)
		
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_PREIST
    	pMon.fX = -350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_PREIST
    	pMon.fX = 350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_PREIST
    	pMon.fX = 0
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function vulcanus_Attack10_3Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	 if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 75 ) then
		pMonster:PlaySound(985030)
		local posy = 0.0
		pMonster:AddParticle("Vulcanus_Circle_01", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Circle_02", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Circle_03", 0.0, posy)
		pMonster:AddParticle("Jin01_SP2-2_Finish_Burn_04", 0.0, 0.1)
		pMonster:AddParticle("Jin01_SP2-2_Finish_Burn_05", 0.0, 0.1)
		
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_PREIST
    	pMon.fX = -350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_PREIST
    	pMon.fX = 350
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_PREIST
    	pMon.fX = 150
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_HELL_PREIST
    	pMon.fX = -150
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function vulcanus_Attack05Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:StartText("DANGER")
	elseif( iFrame == 30 ) then
		pMonster:PlaySound(985031)
		
		pMonster:AddDamageWithLocate(DT_HELL_VULCANUS_LAVA_PATTERN1, 0.5, 0.0, true, false )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function vulcanus_Attack06Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 20 ) then
		pMonster:PlaySound(985033)
		local posX = 0.2
		local posY = 0.0
		if( false == pMonster:GetIsRight() ) then
			posX = -1.0 * posX
		end
		
		pMonster:AddTraceParticleToBone( "Vulcanus_HandFlame_01", 1.0, 10, 8, 8, posX, posY, true )
		pMonster:AddTraceParticleToBone( "Vulcanus_HandFlame_02", 1.0, 10, 8, 8, posX, posY, true )
	elseif( iFrame == 55 ) then
			
		pMonster:AddDamageWithLocate( DT_HELL_VULCANUS_FLAME_PRISON_STARTER, pMonster:GetTargetX(), pMonster:GetTargetY(), true )
	elseif( iFrame == 75 ) then
		pMonster:PlaySound(985034)
		local posX = 0.2
		local posY = 0.0
		if( false == pMonster:GetIsRight() ) then
			posX = -1.0 * posX
		end
		
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_02", 1.0, 10, 8, 8, posX, posY, true )
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_05", 1.0, 10, 8, 8, posX, posY, true )
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_06", 1.0, 10, 8, 8, posX, posY, true )
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_Burn_02", 1.0, 10, 8, 8, posX, posY, true )
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_Burn_04", 1.0, 10, 8, 8, posX, posY, true )
		pMonster:AddTraceParticleToBone( "Jin01_SP3-1_Boom_Burn_05", 1.0, 10, 8, 8, posX, posY, true )
		pMonster:AddTraceParticleToBone( "Thanatos_Righthand_05", 1.0, 10, 8, 8, posX, posY, true )
		pMonster:AddTraceParticleToBone( "Thanatos_Righthand_07", 1.0, 10, 8, 8, posX, posY, true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function vulcanus_Attack07Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 70 ) then
		pMonster:PlaySound(985035)

                local posy = 1.2
                
		pMonster:AddParticle("Jin01_SP3-1_Boom_06", 0.9, posy)
		pMonster:AddParticle("Jin01_SP3-1_Boom_Burn_01", 0.9, posy)
		pMonster:AddParticle("Jin01_SP3-1_Boom_Burn_03", 0.9, posy)
		
		pMonster:AddDamageToAlivePlayer(DT_HELL_HOWLING_GHOST_VULCANUS, 0.9, posy, true)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end


function vulcanus_Attack08( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 35 ) then
		pMonster:PlaySound(985036)
		pMonster:SetMagicEffect( iMonsterIndex, EGC_HELL_VULCANUS_RAGE, 9999999.0, 1, -1, false, false );
	elseif( iFrame == 65 ) then
		pMonster:PlaySound(985037)
		local posy = 0.2
		pMonster:AddParticle("Vulcanus_Rageboom_01", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Rageboom_02", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Rageboom_03", 0.0, posy)
		pMonster:AddParticle("Vulcanus_Rageboom_04", 0.0, posy)
	elseif( iFrame == 100 ) then
		local posy = 0.2
		pMonster:AddParticle("Vulcanus_Rageboom_Under", 0.0, posy)
		pMonster:AddTraceParticleToBone( "Vulcanus_Hair_Fury_01", 1.0, 5, 6, 8 )
		pMonster:AddTraceParticleToBone( "Vulcanus_Hair_Fury_02", 1.0, 5, 5, 7 )
		pMonster:AddTraceParticleToBone( "Vulcanus_Hair_Fury_03", 1.0, 5, 6, 8 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

function vulcanus_Attack09( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:StartText("DANGER")
	elseif( iFrame == 30 ) then
		pMonster:PlaySound(985038)
		local posx = 0.2
		local posy = 1
		if( false == pMonster:GetIsRight()  ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection("Vulcanus_Charge_01", posx, posy)
		pMonster:AddParticleNoDirection("Vulcanus_Charge_02", posx, posy)
		pMonster:AddParticleNoDirection("Vulcanus_Charge_03", posx, posy)
		pMonster:AddParticleNoDirection("Vulcanus_Charge_04", posx, posy)
		pMonster:AddParticleNoDirection("Vulcanus_Charge_05", posx, posy)
		pMonster:AddParticleNoDirection("Circulation_special06_effect_01", posx, posy)
	elseif( iFrame == 81 ) then
		pMonster:AddDamage(DT_HELL_VULCANUS_LASER)
	elseif( iFrame == 83 ) then
		pMonster:PlaySound(985039)
		local posx = 0.2
		local posy = 1
		if( pMonster:GetIsRight()  ) then
			pMonster:AddParticleNoDirection("Vulcanus_Laser_01", posx, posy)
			pMonster:AddParticleNoDirection("Vulcanus_Laser_02", posx, posy)
			pMonster:AddParticleNoDirection("Vulcanus_Laser_03", posx, posy)
			pMonster:AddParticleNoDirection("Vulcanus_Laser_04", posx, posy)
			pMonster:AddParticleNoDirection("Vulcanus_Laser_05", posx, posy)
			pMonster:AddParticleNoDirection("Vulcanus_Laser_06", posx, posy)
			pMonster:AddParticleNoDirection("Vulcanus_Laser_07", posx, posy)
		else
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Vulcanus_Laser_01", posx, posy)
			pMonster:AddParticleNoDirection("Vulcanus_Laser_02_R", posx, posy)
			pMonster:AddParticleNoDirection("Vulcanus_Laser_03_R", posx, posy)
			pMonster:AddParticleNoDirection("Vulcanus_Laser_04_R", posx, posy)
			pMonster:AddParticleNoDirection("Vulcanus_Laser_05_R", posx, posy)
			pMonster:AddParticleNoDirection("Vulcanus_Laser_06_R", posx, posy)
			pMonster:AddParticleNoDirection("Vulcanus_Laser_07_R", posx, posy)
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end


--  �ڷ���Ʈ ����
function vulcanus_TeleportFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:AddParticle( "Setesh_Warp_01", 0.0, -0.34 )
		pMonster:AddParticle( "Setesh_Warp_02", 0.0, -0.34 )
    elseif( iFrame == 2 ) then
		pMonster:ToggleRender( false )
		pMonster:SetPushCheck( false )
		pMonster:SetInvincibleFrame( 20 )
		pMonster:PlaySound( "985022" )
		
		local fRand = pMonster:FloatRand()
		local fDistX = 0.2

		if ( fRand < 0.5 ) then			
			fDistX = 0.2
			if( pMonster:GetTargetIsRight() == true ) then
				pMonster:SetX( pMonster:GetTargetX() - fDistX )
			else
				pMonster:SetX( pMonster:GetTargetX() + fDistX )
			end
			
			pMonster:SetCountValue( 1 )
			
		elseif ( fRand <= 1.0 ) then
			fDistX = 0.7
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetX( pMonster:GetTargetX() - fDistX )
			else
				pMonster:SetX( pMonster:GetTargetX() + fDistX )
			end
			
			pMonster:SetCountValue( 2 )
			
		elseif ( fRand < 1.0 ) then		-- ���� ���� �ȵ����� ��
			fDistX = 0.3
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetX( pMonster:GetTargetX() - fDistX )
			else
				pMonster:SetX( pMonster:GetTargetX() + fDistX )
			end
			
			pMonster:SetCountValue( 3 )		
		end
		
		pMonster:SetY( pMonster:GetTargetY() + 0.1 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end


--  �ڷ���Ʈ ���� ����
function vulcanus_TeleportLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then
		pMonster:AddParticle( "Setesh_Warp_01", 0.0, -0.34 )
		pMonster:AddParticle( "Setesh_Warp_02", 0.0, -0.34 )
    elseif( iFrame == 6 ) then
		pMonster:ToggleRender( true )
		pMonster:SetPushCheck( true )
    elseif( iFrame == 10 ) then
		pMonster:SetInvincible( false )
	elseif( iFrame >= 15 ) then
		pMonster:SetState( "WAIT" )   -- �����ֱ�
		pMonster:SetCountValue(0)
    end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function vulcanus_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -2200, 1000, 2200, -1000 ) == true ) then
		pMonster:ResetDelay()
	end
end

function vulcanus_Check_TurnToTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function vulcanus_Check_Run( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "RUN" )
		pMonster:ResetDelay()
	end
end

function vulcanus_Check_RunStop( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 400, -400, 600, 400, -800 ) == true ) then
		pMonster:SetState( "WAIT" )			
		pMonster:ResetDelay()
	end
end

function vulcanus_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 400, -400, 500, 20, -500 ) == true ) then
		pMonster:SetState( "ATTACK01" )			
		pMonster:ResetDelay()
	end
end

function vulcanus_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 400, -400, 500, 20, -500 ) == true ) then
		pMonster:SetState( "ATTACK02" )			
		pMonster:ResetDelay()
	end
end

function vulcanus_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 400, -400, 600, 400, -800 ) == true ) then
		pMonster:SetState( "ATTACK03" )			
		pMonster:ResetDelay()
	end
end

function vulcanus_Check_Attack04( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	local hpPercent = pMonster:GetHP() / pMonster:GetMaxHP()
	if ( hpPercent <= 0.8 ) then
		-- 0������
		local dungeonLv = g_MyD3D:GetDungeonLevel()
		if ( dungeonLv == 0 ) then
			-- ���̵� 1
			pMonster:SetState("ATTACK04_1")
		elseif ( dungeonLv == 1 ) then
			-- ���̵� 2
			pMonster:SetState("ATTACK04_2")
		elseif ( dungeonLv == 2 ) then
			-- ���̵� 3
			pMonster:SetState("ATTACK04_3")
		end
		pMonster:ResetDelay()
	end
end

function vulcanus_Check_Attack05( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 450, -1000, 800, 1000, -800 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:StartText("DANGER")		
		pMonster:ResetDelay()
	end
end

function vulcanus_Check_Attack06( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 450, -350, 600, 350, -800 ) == true ) then
		pMonster:SetState( "ATTACK06" )			
		pMonster:ResetDelay()
	end
end

function vulcanus_Check_Attack10( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	local dungeonLv = g_MyD3D:GetDungeonLevel()
	if ( dungeonLv == 0 ) then
			-- ���̵� 1
			pMonster:SetState("ATTACK10_1")
	elseif ( dungeonLv == 1 ) then
			-- ���̵� 2
			pMonster:SetState("ATTACK10_2")
	elseif ( dungeonLv == 2 ) then
			-- ���̵� 3
			pMonster:SetState("ATTACK10_3")
	end
	pMonster:ResetDelay()
end

function vulcanus_Check_Attack07( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local hpPercent = pMonster:GetHP() / pMonster:GetMaxHP()
		if ( hpPercent <= 0.8 ) then
		-- 2������
		pMonster:SetState("ATTACK07")
	end
	pMonster:ResetDelay()
end

function vulcanus_Check_Attack08( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local hpPercent = pMonster:GetHP() / pMonster:GetMaxHP()
		if ( hpPercent <= 0.3 ) then
		-- 4������
		pMonster:SetState("ATTACK08")
	end
	pMonster:ResetDelay()
end

function vulcanus_Check_Attack09( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local hpPercent = pMonster:GetHP() / pMonster:GetMaxHP()
		if ( hpPercent <= 0.3 ) then
		-- 4������
		pMonster:SetState("ATTACK09")
	end
	pMonster:ResetDelay()
end

function vulcanus_Check_Teleport( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 100, -400, 350, 400, -250 ) == true ) then
		pMonster:SetState( "TELEPORT" )
		pMonster:ResetDelay()
    end
end

function vulcanus_Check_TeleportLanding( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:TurnToTarget()
	pMonster:SetState( "TELEPORT_LANDING" )
	pMonster:ResetDelay()	
end



-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function Onvulcanus_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
end

function Onvulcanus_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetState( "DIE_LANDING" )
end

function Onvulcanus_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	
	
	if ( pMonster:FloatRand() < 0.15 and pMonster:CheckState("WAIT") ) then	
	
		local fRand = pMonster:FloatRand()
		local hpRate = pMonster:GetHP() / pMonster:GetMaxHP()
		
		if ( hpRate > 0.5 ) then
			if( pMonster:CheckTargetInRange( 1500, -800, 500, 800, -100 ) == true ) then
				--pMonster:SetState( "ATTACK07" )
			elseif( pMonster:CheckTargetInRange( 180, -180, 440, 180, -100 ) == true ) then
				--pMonster:SetState( "ATTACK06" )
			end
		else
			if ( fRand < 0.6 ) then
				if( pMonster:CheckTargetInRange( 1500, -800, 500, 800, -100 ) == true ) then
					--pMonster:SetState( "ATTACK07" )
				elseif( pMonster:CheckTargetInRange( 180, -180, 440, 180, -100 ) == true ) then
					--pMonster:SetState( "ATTACK06" )
				end
			elseif( fRand < 0.8 ) then
				--pMonster:SetState( "ATTACK04" )
			else
				--pMonster:SetState( "ATTACK05" )
			end
		end
		
		pMonster:TurnToTarget()
	end
end
