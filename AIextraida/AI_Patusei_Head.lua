-- AI_Patusei_Head.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Patusei_Head_Wait.frm",
        Func    = "Patusei_Head_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Patusei_Head_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ��պ�
            {
                AICheckFrame        = 90,
                AIFunc              = "Patusei_Head_Check_Attack01",
                DelayFrame          = 123,
            },
        },
    },
    
    -- ��պ�
    {
        ID      = "ATTACK01",
        Motion  = "Patusei_Head_Attack01.frm",
        Func    = "Patusei_Head_Attack01Func",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "patusei_head_die.frm",
        Func    = "Patusei_Head_DieFunc",
    },
}

CallBack =
{
    Land    = "OnPatusei_Head_Land",
    Die     = "OnPatusei_Head_Die",
    Damage  = "OnPatusei_Head_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitPatusei_Head( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetIsRight( false )
    pMonster:SetFly( true ) 
    pMonster:SetX( 2.37 )
    pMonster:SetY( 1.56 )
pMonster:SetHP( 1 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Patusei_Head_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �״»���
function Patusei_Head_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
        pMonster:EndMonster()
    end
end

--  �������� ����
function Patusei_Head_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 31 ) then
		pMonster:SkillReadyEffectNoStop( 220, 220, 220, 0.0 )
    elseif( iFrame == 61 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.15 )
    elseif( iFrame == 81 ) then
		pMonster:AddParticle( "patu_beam_01", 0.11, 0.19 )
		pMonster:AddParticle( "patu_beam_02", 0.11, 0.19 )
		pMonster:AddParticle( "patu_beam_03", 0.11, 0.19 )
		pMonster:AddParticle( "Las01_Hornet_Sting_Finish_01", 0.11, 0.19 )
		pMonster:AddDamageWithAngle( DT_MONSTER_YONGWANG_BEAM, pMonster:GetAngleToTarget() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Patusei_Head_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Patusei_Head_Check_Attack01( iMonsterIndex, iFrame )
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
function OnPatusei_Head_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
end

function OnPatusei_Head_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnPatusei_Head_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetIsRight( false )
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( true )
	pMonster:SetFly( true ) 
end
