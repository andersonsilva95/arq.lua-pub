-- AI_AgitChar_Man.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "NPC_wait_man.frm",
        Func    = "AgitChar_Man_WaitFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "HI",
        Motion  = "NPC_hi_man.frm",
        Func    = "AgitChar_Man_HiFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "NOBLE_HI",
        Motion  = "NPC_noble_hi_man.frm",
        Func    = "AgitChar_Man_NobleHiFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "SHOULDER_HI",
        Motion  = "NPC_shoulder_hi_man.frm",
        Func    = "AgitChar_Man_ShoulderHiFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "KISS",
        Motion  = "NPC_kiss_man.frm",
        Func    = "AgitChar_Man_KissFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "SIT_DOWN",
        Motion  = "NPC_down_man.frm",
        Func    = "AgitChar_Man_SitDownFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "SIT_DOWN_ACTION",
        Motion  = "NPC_down_action_man.frm",
        Func    = "AgitChar_Man_SitDownActionFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "DROWSE",
        Motion  = "NPC_ZZZ_man.frm",
        Func    = "AgitChar_Man_DrowseFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "DROWSE_ACTION",
        Motion  = "NPC_ZZZ_action_man.frm",
        Func    = "AgitChar_Man_DrowswActionFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "CLEANING",
        Motion  = "NPC_cleaning_man.frm",
        Func    = "AgitChar_Man_CleaningFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "CLEANING_ACTION",
        Motion  = "NPC_cleaning_action_man.frm",
        Func    = "AgitChar_Man_CleaningActionFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
	
	{
        ID      = "DANCE",
        Motion  = "3270.frm",
        Func    = "AgitChar_Man_DanceFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
    
    {
        ID      = "OTL",
        Motion  = "NPC_OTL.frm",
        Func    = "AgitChar_Man_OTLFunc",
		
		Trigger = 
        {
            -- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Agit_Char_Man_Check_Targeting",
                DelayFrame          = 300,
            },
        },
    },
}

CallBack =
{

}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitAgitChar_Man( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function AgitChar_Man_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 인사 
function AgitChar_Man_HiFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "HI" )
    end
end
    
-- 귀족인사 
function AgitChar_Man_NobleHiFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "NOBLE_HI" )
    end
end
    
-- 어깨인사 
function AgitChar_Man_ShoulderHiFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "SHOULDER_HI" )
    end
end
    
-- 입술날리기 
function AgitChar_Man_KissFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
	
	if( iFrame == 80 ) then
		pMonster:AddParticle( "House_Motion_Heart_01", -0.02, 0.23 )
		pMonster:AddParticle( "House_Motion_Heart_03", -0.02, 0.23 )
	end
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "KISS" )
    end
end
    
-- 앉기 
function AgitChar_Man_SitDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "SIT_DOWN_ACTION" )
    end
end

function AgitChar_Man_SitDownActionFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "SIT_DOWN" )
    end
end    

-- 졸기 
function AgitChar_Man_DrowseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMesh( "BROOM", true )
	pMonster:SetChildMeshMotion("BROOM", "NPC_broom_ZZZ_man", true, true )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DROWSE_ACTION" )
    end
end

function AgitChar_Man_DrowswActionFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMesh( "BROOM", true )
	pMonster:SetChildMeshMotion("BROOM", "NPC_broom_ZZZ_action_man", true, true )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DROWSE" )
    end
end   

-- 청소 
function AgitChar_Man_CleaningFunc( iMonsterIndex, iFrame )
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

function AgitChar_Man_CleaningActionFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetInvincible( true )
	pMonster:ToggleExtraMesh( "BROOM", true )
	pMonster:SetChildMeshMotion("BROOM", "NPC_broom_action", true, false )
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "CLEANING" )
    end
end

-- 춤추기 
function AgitChar_Man_DanceFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DANCE" )
    end
end

-- 좌절 
function AgitChar_Man_OTLFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	pMonster:ToggleExtraMeshAll( false )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "OTL" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Agit_Char_Man_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( pMonster:SetTarget( 0, -90, 70, 90, -70 ) == true ) then
		pMonster:SetAgitCharCloseMent()
        pMonster:ResetDelay()
    end  
end