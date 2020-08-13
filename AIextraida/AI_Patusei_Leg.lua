-- AI_Patusei_Leg.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Patusei_Leg_Wait.frm",
        Func    = "Patusei_Leg_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Patusei_Leg_Check_Targeting",
                DelayFrame          = 110,
            },
        	-- �߱�����
            {
                AICheckFrame        = 550,
                AIFunc              = "Patusei_Leg_Check_Attack01",
                DelayFrame          = 550,
            },
        },
    },
    
    -- �߱�����(��������)
    {
        ID      = "ATTACK01",
        Motion  = "Patusei_Leg_Attack01.frm",
        Func    = "Patusei_Leg_Attack01Func",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Patusei_Leg_Wait.frm",
        Func    = "Patusei_Leg_DieFunc",
    },
}

CallBack =
{
    Land    = "OnPatusei_Leg_Land",
    Die     = "OnPatusei_Leg_Die",
    Damage  = "OnPatusei_Leg_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitPatusei_Leg( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetIsRight( false )
    pMonster:SetX( 2.4 )
    pMonster:SetY( 0.0 )
pMonster:SetHP( 1 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Patusei_Leg_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �״»���
function Patusei_Leg_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == pMonster:GetLastFrame() - 1 ) then
		local posx = -0.2
		local posy = 0.5
		pMonster:AddParticleNoDirection("Patu_Leg", posx - 0.2, posy + 0.1)
		pMonster:AddParticleNoDirection("Patu_Spark_01", posx, posy)
		pMonster:AddParticleNoDirection("Patu_Spark_02", posx, posy)
		pMonster:AddParticleNoDirection("Patu_Spark_03", posx, posy)
		pMonster:AddParticleNoDirection("Patu_Spark_04", posx, posy)
		pMonster:AddParticleNoDirection("Patu_Spark_05", posx, posy)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

--  �������� ����
function Patusei_Leg_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 61 ) then
		pMonster:EarthQuake( 30, 0.06, 0.025 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Patusei_Leg_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 400, -800, 800, 800, -100 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Patusei_Leg_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnPatusei_Leg_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
end

function OnPatusei_Leg_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnPatusei_Leg_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetIsRight( false )
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( true )
end

