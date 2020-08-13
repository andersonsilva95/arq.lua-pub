-- AI_Patusei_Leg.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Patusei_Leg_Wait.frm",
        Func    = "Patusei_Leg_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Patusei_Leg_Check_Targeting",
                DelayFrame          = 110,
            },
        	-- 발구르기
            {
                AICheckFrame        = 550,
                AIFunc              = "Patusei_Leg_Check_Attack01",
                DelayFrame          = 550,
            },
        },
    },
    
    -- 발구르기(지진공격)
    {
        ID      = "ATTACK01",
        Motion  = "Patusei_Leg_Attack01.frm",
        Func    = "Patusei_Leg_Attack01Func",
    },
    
    -- 죽기
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
-- 초기화 함수
-----------------------------------------------------------------------

function InitPatusei_Leg( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetIsRight( false )
    pMonster:SetX( 2.4 )
    pMonster:SetY( 0.0 )
pMonster:SetHP( 1 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Patusei_Leg_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 죽는상태
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

--  근접공격 상태
function Patusei_Leg_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 61 ) then
		pMonster:EarthQuake( 30, 0.06, 0.025 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
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
-- 콜백 함수
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

