-- AI_AgitBreak_Girl.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "break_girl_wait.frm",
        Func    = "AgitBreak_Girl_WaitFunc",
    },

    -- ���� 5�� ���ϸ�� ó��
    {
        ID      = "BREAK_5",
        Motion  = "break_girl_A.frm",
        Func    = "AgitBreak_Girl_5", 
    },

    -- ���� 10�� ���ϸ�� ó��
    {
        ID      = "BREAK_10",
        Motion  = "break_girl_B.frm",
        Func    = "AgitBreak_Girl_10", 
    },
}

CallBack =
{

}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitAgitBreak_Girl( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local pPlayer = g_MyD3D:GetPlayerByUID( MotherUID )
    
    pPlayer.m_bRender = false
    g_MyD3D:SetEnableKeyInput( false )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function AgitBreak_Girl_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local pPlayer = g_MyD3D:GetPlayerByUID( MotherUID )
    
    pPlayer.m_bIsAgitBreaking = true
    pPlayer.m_bRender = false
    g_MyD3D:SetEnableKeyInput( false )

    if( iFrame == 1 ) then
        pMonster:AddParticleNoDirection("House_Training_Start_01", 0.0, 0.12)
        pMonster:AddParticleNoDirection("House_Training_Start_02", 0.0, 0.12)
        pMonster:AddParticleNoDirection("House_Training_Start_03", 0.0, 0.12)
        
        pPlayer:AddParticleNoDirectionPos("House_Training_Start_01", 0.0, 0.12)
        pPlayer:AddParticleNoDirectionPos("House_Training_Start_02", 0.0, 0.12)
        pPlayer:AddParticleNoDirectionPos("House_Training_Start_03", 0.0, 0.12)
    end

    -- 5������ ���� 10������ ���� ó��
    if( iFrame >= pMonster:GetLastFrame() ) then
        if( 5 >= pMonster.m_iRecvStateFromPlayer ) then
            pMonster:SetState( "BREAK_5" )
        else
            pMonster:SetState( "BREAK_10" ) 
        end
        pMonster.m_iRecvStateFromPlayer = 0
    end
end

-- ���� 5�� ����
function AgitBreak_Girl_5( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local pPlayer = g_MyD3D:GetPlayerByUID( MotherUID )

    if( iFrame == 120 ) then

        local LoopNum = g_MyD3D:Num_TrainingObj()
		g_MyD3D:Clear_TrainingTile()
		if( LoopNum == 1 ) then
			pMonster:AddParticleNoDirection("House_Training_Wood_01", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_01_1", 0.0, 0.0 )
		elseif( LoopNum == 2 ) then
			pMonster:AddParticleNoDirection("House_Training_Wood_01", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_01_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_02", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_02_1", 0.0, 0.0 )
		elseif( LoopNum == 3 ) then
			pMonster:AddParticleNoDirection("House_Training_Wood_01", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_01_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_02", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_02_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_03", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_03_1", 0.0, 0.0 )
		elseif( LoopNum == 4 ) then
			pMonster:AddParticleNoDirection("House_Training_Wood_01", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_01_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_02", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_02_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_03", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_03_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_04", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_04_1", 0.0, 0.0 )
		elseif( LoopNum == 5 ) then
			pMonster:AddParticleNoDirection("House_Training_Wood_01", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_01_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_02", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_02_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_03", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_03_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_04", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_04_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_05", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_05_1", 0.0, 0.0 )
		end
		
        pMonster:AddParticleNoDirection("House_Training_Hit_01", 0.0, 0.0)
        pMonster:AddParticleNoDirection("House_Training_Hit_02", 0.0, 0.0)
        pMonster:AddParticleNoDirection("House_Training_Hit_03", 0.0, 0.0)
        pMonster:AddParticleNoDirection("House_Training_Hit_04", 0.0, 0.0)

    elseif( iFrame == 210 ) then

        pMonster:AddParticleNoDirection("House_Training_Start_01", -0.03, 0.12)
        pMonster:AddParticleNoDirection("House_Training_Start_02", -0.03, 0.12)
        pMonster:AddParticleNoDirection("House_Training_Start_03", -0.03, 0.12)
        
        pPlayer:AddParticleNoDirectionPos("House_Training_Start_01", -0.03, 0.12)
        pPlayer:AddParticleNoDirectionPos("House_Training_Start_02", -0.03, 0.12)
        pPlayer:AddParticleNoDirectionPos("House_Training_Start_03", -0.03, 0.12)    

    end
    
    -- ������ ����ְ� �� �״´�.
    if( iFrame >= pMonster:GetLastFrame() ) then

        pPlayer.m_bIsAgitBreaking = false
        pPlayer.m_bRender = true
        g_MyD3D:SetEnableKeyInput( true )
        pMonster:EndMonster( true, true )
        pMonster:SetLive( false )

    else
        g_MyD3D:SetEnableKeyInput( false )
        pPlayer.m_bRender = false
        pPlayer.m_bIsAgitBreaking = true
    end
end

-- ���� 10�� ����
function AgitBreak_Girl_10( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local pPlayer = g_MyD3D:GetPlayerByUID( MotherUID )
    
    if( iFrame == 135 ) then

        local LoopNum = g_MyD3D:Num_TrainingObj()
		g_MyD3D:Clear_TrainingTile()
		if( LoopNum == 6 )	then
			pMonster:AddParticleNoDirection("House_Training_Wood_01", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_01_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_02", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_02_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_03", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_03_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_04", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_04_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_05", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_05_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_06", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_06_1", 0.0, 0.0 )
		elseif( LoopNum == 7 )	then
			pMonster:AddParticleNoDirection("House_Training_Wood_01", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_01_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_02", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_02_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_03", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_03_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_04", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_04_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_05", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_05_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_06", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_06_1", 0.0, 0.0 )	
			pMonster:AddParticleNoDirection("House_Training_Wood_07", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_07_1", 0.0, 0.0 )	
		elseif( LoopNum == 8 )	then
			pMonster:AddParticleNoDirection("House_Training_Wood_01", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_01_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_02", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_02_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_03", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_03_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_04", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_04_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_05", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_05_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_06", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_06_1", 0.0, 0.0 )	
			pMonster:AddParticleNoDirection("House_Training_Wood_07", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_07_1", 0.0, 0.0 )				
			pMonster:AddParticleNoDirection("House_Training_Wood_08", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_08_1", 0.0, 0.0 )
		elseif( LoopNum == 9 )	then
			pMonster:AddParticleNoDirection("House_Training_Wood_01", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_01_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_02", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_02_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_03", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_03_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_04", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_04_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_05", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_05_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_06", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_06_1", 0.0, 0.0 )	
			pMonster:AddParticleNoDirection("House_Training_Wood_07", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_07_1", 0.0, 0.0 )				
			pMonster:AddParticleNoDirection("House_Training_Wood_08", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_08_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_09", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_09_1", 0.0, 0.0 )
		elseif( LoopNum == 10 ) then	
			pMonster:AddParticleNoDirection("House_Training_Wood_01", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_01_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_02", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_02_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_03", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_03_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_04", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_04_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_05", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_05_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_06", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_06_1", 0.0, 0.0 )	
			pMonster:AddParticleNoDirection("House_Training_Wood_07", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_07_1", 0.0, 0.0 )				
			pMonster:AddParticleNoDirection("House_Training_Wood_08", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_08_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_09", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_09_1", 0.0, 0.0 )
			pMonster:AddParticleNoDirection("House_Training_Wood_10", 0.0, 0.0)
	        pMonster:AddParticleNoDirection("House_Training_Wood_10_1", 0.0, 0.0 )
		end

        pMonster:AddParticleNoDirection("House_Training_Hit_Big_01", 0.0, 0.0)
        pMonster:AddParticleNoDirection("House_Training_Hit_Big_02", 0.0, 0.0)
        pMonster:AddParticleNoDirection("House_Training_Hit_Big_03", 0.0, 0.0)
        pMonster:AddParticleNoDirection("House_Training_Hit_Big_04", 0.0, 0.0)

    elseif( iFrame == 230 ) then
        pMonster:AddParticleNoDirection("House_Training_Start_01", 0.0, 0.12)
        pMonster:AddParticleNoDirection("House_Training_Start_02", 0.0, 0.12)
        pMonster:AddParticleNoDirection("House_Training_Start_03", 0.0, 0.12)
        
        pPlayer:AddParticleNoDirectionPos("House_Training_Start_01", 0.0, 0.12)
        pPlayer:AddParticleNoDirectionPos("House_Training_Start_02", 0.0, 0.12)
        pPlayer:AddParticleNoDirectionPos("House_Training_Start_03", 0.0, 0.12)    
    end
    
    -- ������ ����ְ� �� �״´�.
    if( iFrame >= pMonster:GetLastFrame() ) then

        pPlayer.m_bIsAgitBreaking = false
        pPlayer.m_bRender = true
        g_MyD3D:SetEnableKeyInput( true )
        pMonster:EndMonster( true, true )
        pMonster:SetLive( false )
        
    else
        g_MyD3D:SetEnableKeyInput( false )
        pPlayer.m_bRender = false
        pPlayer.m_bIsAgitBreaking = true
    end
end