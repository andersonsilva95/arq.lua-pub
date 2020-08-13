-- AI_AgitChar_Girl.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "NPC_wait_girl.frm",
        Func    = "AgitChar_Girl_WaitFunc",
        
        Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "HI",
        Motion  = "NPC_hi_girl.frm",
        Func    = "AgitChar_Girl_HiFunc",
		
		Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "NOBLE_HI",
        Motion  = "NPC_noble_hi_girl.frm",
        Func    = "AgitChar_Girl_NobleHiFunc",
		
		Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "SHOULDER_HI",
        Motion  = "NPC_shoulder_hi_girl.frm",
        Func    = "AgitChar_Girl_ShoulderHiFunc",
		
		Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "KISS",
        Motion  = "NPC_kiss_girl.frm",
        Func    = "AgitChar_Girl_KissFunc",
		
		Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "SIT_DOWN",
        Motion  = "NPC_down_girl.frm",
        Func    = "AgitChar_Girl_SitDownFunc",
		
		Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "SIT_DOWN_ACTION",
        Motion  = "NPC_down_action_girl.frm",
        Func    = "AgitChar_Girl_SitDownActionFunc",
		
		Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "DROWSE",
        Motion  = "NPC_ZZZ_girl.frm",
        Func    = "AgitChar_Girl_DrowseFunc",
		
		Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "DROWSE_ACTION",
        Motion  = "NPC_ZZZ_action_girl.frm",
        Func    = "AgitChar_Girl_DrowswActionFunc",
		
		Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "CLEANING",
        Motion  = "NPC_cleaning_girl.frm",
        Func    = "AgitChar_Girl_CleaningFunc",
		
		Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "CLEANING_ACTION",
        Motion  = "NPC_cleaning_action_girl.frm",
        Func    = "AgitChar_Girl_CleaningActionFunc",
		
		Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
	
	{
        ID      = "DANCE",
        Motion  = "3271.frm",
        Func    = "AgitChar_Girl_DanceFunc",
		
		Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "OTL",
        Motion  = "NPC_OTL.frm",
        Func    = "AgitChar_Girl_OTLFunc",
		
		Trigger = 
        {
            -- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Girl_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
}

CallBack =
{

}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitAgitChar_Girl( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function AgitChar_Girl_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �λ� 
function AgitChar_Girl_HiFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "HI" )
    end
end
    
-- �����λ� 
function AgitChar_Girl_NobleHiFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "NOBLE_HI" )
    end
end
    
-- ����λ� 
function AgitChar_Girl_ShoulderHiFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "SHOULDER_HI" )
    end
end
    
-- �Լ������� 
function AgitChar_Girl_KissFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
	
	if( iFrame == 35 ) then
		--pMonster:AddParticle( "House_Motion_Heart_01", -0.01, 0.22 )
		pMonster:AddParticle( "House_Motion_Heart_02", -0.01, 0.22 )
	end

	if( iFrame == 85 ) then
		--pMonster:AddParticle( "House_Motion_Heart_01", -0.01, 0.22 )
		pMonster:AddParticle( "House_Motion_Heart_02", -0.01, 0.22 )
	end

	if( iFrame == 185 ) then
		pMonster:AddParticle( "House_Motion_Heart_01", -0.01, 0.22 )
		pMonster:AddParticle( "House_Motion_Heart_02", -0.01, 0.22 )
	end
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "KISS" )
    end
end
    
-- �ɱ� 
function AgitChar_Girl_SitDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "SIT_DOWN_ACTION" )
    end
end

function AgitChar_Girl_SitDownActionFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "SIT_DOWN" )
    end
end    

-- ���� 
function AgitChar_Girl_DrowseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMesh( "BROOM", true )
	pMonster:SetChildMeshMotion("BROOM", "NPC_broom_ZZZ_girl", true, true )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DROWSE_ACTION" )
    end
end

function AgitChar_Girl_DrowswActionFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMesh( "BROOM", true )
	pMonster:SetChildMeshMotion("BROOM", "NPC_broom_ZZZ_action_girl", true, true )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DROWSE" )
    end
end   

-- û�� 
function AgitChar_Girl_CleaningFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMesh( "BROOM", true )
	
	if( iFrame == 0 ) then
		pMonster:SetChildMeshMotion("BROOM", "NPC_broom", true, true )
	end
	if( iFrame == 10 ) then
		pMonster:AddTraceParticleOffset( "House_Motion_Dust", 0.0, -0.03, 3 )
	end
	if( iFrame == 90 ) then
		pMonster:AddTraceParticleOffset( "House_Motion_Dust", 0.0, -0.03, 3 )
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "CLEANING_ACTION" )
    end
end

function AgitChar_Girl_CleaningActionFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMesh( "BROOM", true )
	pMonster:SetChildMeshMotion("BROOM", "NPC_broom_action", true, false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "CLEANING" )
    end
end

-- ���߱� 
function AgitChar_Girl_DanceFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DANCE" )
    end
end

-- ���� 
function AgitChar_Girl_OTLFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "OTL" )
    end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Agit_Char_Girl_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( pMonster:SetTarget( 0, -90, 70, 90, -70 ) == true ) then
		pMonster:SetAgitCharCloseMent()
        pMonster:ResetDelay()
    end  
end