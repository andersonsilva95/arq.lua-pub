-- AI_DivineTree01.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "DivineTree01_Wait.frm",
        Func    = "DivineTree01_WaitFunc",

        Trigger =
        {
			-- Ÿ����
			{
				AICheckFrame	= 10,
				AIFunc			= "DivineTree01_Check_Targeting",
				DelayFrame		= 10,
			},

			-- acid rain
            {
                AICheckFrame        = 100,
                AIFunc              = "DivineTree01_Check_Attack01",
                DelayFrame          = 100,
            },

            -- ���̺� Center
            {
                AICheckFrame        = 51,
                AIFunc              = "DivineTree01_Check_Attack02_1",
                DelayFrame          = 250,
            },

            -- ���̺� Left
            {
                AICheckFrame        = 52,
                AIFunc              = "DivineTree01_Check_Attack02_2",
                DelayFrame          = 300,
            },

            -- ���̺� Rifht
            {
                AICheckFrame        = 52,
                AIFunc              = "DivineTree01_Check_Attack02_3",
                DelayFrame          = 300,
            },

            -- ����� ���
            {
                AICheckFrame        = 20,
                AIFunc              = "DivineTree01_Check_Attack03",
                DelayFrame          = 780,
            },

            -- �Ѹ�����
            {
                AICheckFrame        = 200,
                AIFunc              = "DivineTree01_Check_Attack04",
                DelayFrame          = 100,
            },

            -- ���Ǳ��
            {
                AICheckFrame        = 300,
                AIFunc              = "DivineTree01_Check_Attack05",
                DelayFrame          = 1000,
            },
        },
    },
    
    -- acid rain
    {
        ID      = "ATTACK01",
        Motion  = "DivineTree01_Wait.frm",
        Func    = "DivineTree01_Attack01Func",
    },
    
    -- 
    {
        ID      = "ATTACK02_1",
        Motion  = "DivineTree01_Attack02_1.frm",
        Func    = "DivineTree01_Attack02_1Func",
    },
    -- 
    {
        ID      = "ATTACK02_2",
        Motion  = "DivineTree01_Attack02_2.frm",
        Func    = "DivineTree01_Attack02_2Func",
    },
    -- 
    {
        ID      = "ATTACK02_3",
        Motion  = "DivineTree01_Attack02_3.frm",
        Func    = "DivineTree01_Attack02_3Func",
    },
    
    -- ����� ���~
    {
        ID      = "ATTACK03",
        Motion  = "DivineTree01_Wait.frm",
        Func    = "DivineTree01_Attack03Func",
    },
    
    -- �Ѹ�����
    {
        ID      = "ATTACK04",
        Motion  = "DivineTree01_Wait.frm",
        Func    = "DivineTree01_Attack04Func",
    },
    
    -- ���Ǳ��
    {
        ID      = "ATTACK05",
        Motion  = "DivineTree01_Wait.frm",
        Func    = "DivineTree01_Attack05Func",
    },

	-- ���Ǳ��
    {
        ID      = "ATTACK05_1",
        Motion  = "DivineTree01_Wait.frm",
        Func    = "DivineTree01_Attack05_1Func",
    },

    {
        ID                  = "DIE",
        Motion              = "DivineTree01_Die.frm",
        Func                = "DivineTree01_DieFunc",
    },
}

CallBack =
{
	Die     = "OnDivineTree01_Die",
}
-----------------------------------------------------------------------
-- �ʱ�ȭ ����
-----------------------------------------------------------------------
ADeadBranchCount = 0
IsAcidRain = false
IsLive1 = true
IsLive2 = true
IsLive3 = true
IsLive4 = true

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitDevineTree( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetIsRight( true )
    pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( false )
    pMonster:SetFly( true )
	pMonster:SetX( 1.5 )
	pMonster:SetY( -0.08 )
	--pMonster:InitTimer()
	--pMonster:StartTimer()
	--pMonster:GetTimer() ( ������ ������~ )
	--pMonster:StopTimer()
	
	pMonster:RegisterSummonMonsterType( MON_POISONTHORN_FOR_BOSS )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function DivineTree01_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	g_kCamera.WideMode = 8
	pMonster:SetPushCheck( false )
	pMonster:SetIsRight( true )
	
	if( iFrame == 2 ) then
		if( ADeadBranchCount ~= 4 ) then
			local pBranch = g_MyD3D:GetMonster(1)
			if( IsLive1 and pBranch:GetHP() <= 0 ) then
				IsLive1 = false
				ADeadBranchCount = ADeadBranchCount + 1
			end
			pBranch = g_MyD3D:GetMonster(2)
			if( IsLive2 and pBranch:GetHP() <= 0 ) then
				IsLive2 = false
				ADeadBranchCount = ADeadBranchCount + 1
			end
			pBranch = g_MyD3D:GetMonster(3)
			if( IsLive3 and pBranch:GetHP() <= 0 ) then
				IsLive3 = false
				ADeadBranchCount = ADeadBranchCount + 1
			end
			pBranch = g_MyD3D:GetMonster(4)
			if( IsLive4 and pBranch:GetHP() <= 0 ) then
				IsLive4 = false
				ADeadBranchCount = ADeadBranchCount + 1
			end
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  acid rain
function DivineTree01_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1) then
    elseif( iFrame == 42 ) then
		pMonster:SkillReadyEffect( 200, 20, 20, 1.07 )
    elseif( iFrame == 50 ) then
		local posx = 0.0
		local posy = 1.07
		pMonster:AddParticle("Divine_Tree_Acidrain_Start_01", posx, posy)
		pMonster:AddParticle("Divine_Tree_Acidrain_Start_01", posx, posy)
		pMonster:PlaySound(996006, 1)
    elseif( iFrame == 92 ) then
		local posx = -0.3
		local posy = 0.3
		pMonster:AddParticle("Divine_Tree_Acidrain_01", posx, posy, true)
		pMonster:AddParticle("Divine_Tree_Acidrain_02", posx, posy, true)
		pMonster:AddParticle("Divine_Tree_Acidrain_04", posx, posy, true)
		pMonster:AddDamage(DT_DIVINE_TREE_ACID_RAIN)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���׹��
function DivineTree01_Attack02_1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 90 ) then
		pMonster:PlaySound(996002)
    elseif( iFrame == 92 ) then
		local posx = 0.0
		local posy = 2.2
		pMonster:AddParticle("Divine_Tree_Sonic_Wave_01", posx, posy)
		pMonster:AddParticle("Divine_Tree_Sonic_Wave_02", posx, posy)
		pMonster:AddDamage(DT_DIVINE_TREE_POISON_BREATH)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���׹��
function DivineTree01_Attack02_2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local posY
    
    if( iFrame <= 1) then
    elseif( iFrame == 90 ) then
		pMonster:PlaySound(996002)
    elseif( iFrame == 92 ) then
		local posx = -0.8
		local posy = 1.8
		pMonster:AddParticle("Divine_Tree_Sonic_Wave_01_L", posx, posy)
		pMonster:AddParticle("Divine_Tree_Sonic_Wave_02_L", posx, posy)
		pMonster:AddDamage(DT_DIVINE_TREE_POISON_BREATH_L)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���׹��
function DivineTree01_Attack02_3Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
     elseif( iFrame == 90 ) then
		pMonster:PlaySound(996002)
    elseif( iFrame == 92 ) then
		local posx = 0.75
		local posy = 1.8
		pMonster:AddParticle("Divine_Tree_Sonic_Wave_01_R", posx, posy)
		pMonster:AddParticle("Divine_Tree_Sonic_Wave_02_R", posx, posy)
		pMonster:AddDamage(DT_DIVINE_TREE_POISON_BREATH_R)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �����
function DivineTree01_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
	elseif( iFrame == 100 ) then
		pMonster:PlaySound(996004)
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_POISONTHORN_FOR_BOSS

		if ( pMonster:FloatRand() < 0.5 ) then
			if ( pMonster:FloatRand() < 0.5 ) then
	        	pMon.fX = -350
	        	pMon.fY = 810
			else
				pMon.fX = 350
	        	pMon.fY = 810
			end

		else
			if ( pMonster:FloatRand() < 0.5 ) then
	        	pMon.fX = -400
	        	pMon.fY = 120
			else
				pMon.fX = 400
	        	pMon.fY = 120
			end
		end

		pMonster:SummonMonster( pMon )

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �Ѹ�����
function DivineTree01_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
    
    elseif( iFrame == 50 ) then
		local posx = 0.0
		local posy = 1.07
		pMonster:AddParticle("Divine_Tree_Root_01", posx, posy)
		pMonster:AddParticle("Divine_Tree_Root_02", posx, posy)
		pMonster:AddParticle("Divine_Tree_Root_03", posx, posy)
	elseif( iFrame == 100 ) then
		pMonster:PlaySound(996005)
		pMonster:AddDamageWithLocate( DT_DIVINE_TREE_SUNKEN_AREA )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���Ǳ��
function DivineTree01_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1) then
	elseif( iFrame == 50 ) then
		local posx = 0.0
		local posy = 1.07
		pMonster:AddParticle("Divine_Tree_Charge_01", posx, posy)
		pMonster:AddParticle("Divine_Tree_Charge_02", posx, posy)
		pMonster:AddParticle("Divine_Tree_Charge_03", posx, posy)
		pMonster:AddParticle("Divine_Tree_Light_Pillar_Boom_01", posx, posy)
		pMonster:AddParticle("Divine_Tree_Light_Pillar_Boom_02", posx, posy)
		pMonster:AddParticle("Divine_Tree_Light_Pillar_Boom_03", posx, posy)
	elseif( iFrame == 100 ) then
		pMonster:PlaySound(996001)
		pMonster:AddDamageWithLocate(DT_DIVINE_TREE_HOLY_POLE, 0.23, 0.535, true )
		pMonster:AddDamageWithLocate(DT_DIVINE_TREE_HOLY_POLE, 2.7, 0.535, true )
		pMonster:AddDamageWithLocate(DT_DIVINE_TREE_HOLY_POLE, 0.45, 2.27, true )
		pMonster:AddDamageWithLocate(DT_DIVINE_TREE_HOLY_POLE, 2.30, 1.57, true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���Ǳ��
function DivineTree01_Attack05_1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1) then
	elseif( iFrame == 50 ) then
		local posx = 0.0
		local posy = 1.07
		pMonster:AddParticle("Divine_Tree_Charge_01", posx, posy)
		pMonster:AddParticle("Divine_Tree_Charge_02", posx, posy)
		pMonster:AddParticle("Divine_Tree_Charge_03", posx, posy)
		pMonster:AddParticle("Divine_Tree_Light_Pillar_Boom_01", posx, posy)
		pMonster:AddParticle("Divine_Tree_Light_Pillar_Boom_02", posx, posy)
		pMonster:AddParticle("Divine_Tree_Light_Pillar_Boom_03", posx, posy)
	elseif( iFrame == 100 ) then
		pMonster:PlaySound(996001)
		pMonster:AddDamageWithLocate(DT_DIVINE_TREE_HOLY_POLE, 2.3, 0.535, true )		
		pMonster:AddDamageWithLocate(DT_DIVINE_TREE_HOLY_POLE, 0.49, 1.95, true )		
		pMonster:AddDamageWithLocate(DT_DIVINE_TREE_HOLY_POLE, 1.5, 0.93, true )
		pMonster:AddDamageWithLocate(DT_DIVINE_TREE_HOLY_POLE, 2.60, 2.25, true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �׾���
function DivineTree01_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(998020)
		pMonster:AddTraceParticleToBone( "DivineTree01_Clap_Dust_01", 1.0, 3, 0, 0, posx, -0.1 )		-- ��
		pMonster:AddTraceParticleToBone( "DivineTree01_Clap_Dust_01", 1.0, 9, 0, 0, posx, -0.1 )		-- ��
		pMonster:AddTraceParticleToBone( "DivineTree01_Clap_Dust_01", 1.0, 9, 0, 0, posx, -0.1 )		-- �Ȳ�ġ ��
		pMonster:AddTraceParticleToBone( "DivineTree01_Clap_Dust_01", 1.0, 10, 0, 0, posx, -0.1 )	-- �Ȳ�ġ ����
		pMonster:AddTraceParticleToBone( "DivineTree01_Clap_Dust_01", 1.0, 18, 0, 0, posx, -0.1 )	-- �ո� ��
		pMonster:AddTraceParticleToBone( "DivineTree01_Clap_Dust_01", 1.0, 19, 0, 0, posx, -0.1 )	-- �ո� ����
		pMonster:AddTraceParticleToBone( "DivineTree01_Clap_Dust_01", 1.0, 31, 0, 0, posx, -0.1 )	-- �߸� ��
		pMonster:AddTraceParticleToBone( "DivineTree01_Clap_Dust_01", 1.0, 27, 0, 0, posx, -0.1 )	-- �߸� ����
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

--  �׾���
function DivineTree01_EndFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetY(0.0)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end


-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------
function DivineTree01_Check_Targeting( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -600, 1300, 600, -600 ) == true ) then
		pMonster:ResetDelay()
	end
end

function DivineTree01_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    
    if( ADeadBranchCount == 4 and IsAcidRain == false ) then
		IsAcidRain = true
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function DivineTree01_Check_Attack02_1( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -400, 1000, 400, 460) == true ) then
		pMonster:SetState( "ATTACK02_1" )
		pMonster:ResetDelay()
	end
end

function DivineTree01_Check_Attack02_2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( -400, -200, 1200, 300, 300) == true ) then
		pMonster:SetState( "ATTACK02_2" )
		pMonster:ResetDelay()
	end
end

function DivineTree01_Check_Attack02_3( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 400, -300, 1200, 200, 300) == true ) then
		pMonster:SetState( "ATTACK02_3" )
		pMonster:ResetDelay()
	end
end

function DivineTree01_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:GetSummonedMonsterCount() < 2 ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function DivineTree01_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:SetState( "ATTACK04" )
	pMonster:ResetDelay()
end

function DivineTree01_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK05" )
	else
		pMonster:SetState( "ATTACK05_1" )
	end
	pMonster:ResetDelay()
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnDivineTree01_Die( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetState( "DIE" )
end
