-- AI_Gaint_BackGround.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Giant_Wait.frm",
        Func    = "Gaint_BackGround_WaitFunc",

        Trigger =
        {
            -- 지진크~
            {
                AICheckFrame        = 300,
                AIFunc              = "Gaint_BackGround_Check_Attack01",
                DelayFrame          = 400,
            },
        },
    },
    
    -- 지진크
    {
        ID      = "ATTACK01",
        Motion  = "Giant_Attack01.frm",
        Func    = "Gaint_BackGround_Attack01Func",
    },
}

CallBack =
{
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitGaint_BackGround( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetInvincible( true )
    pMonster:SetIsRight( true )
    pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( false )
    pMonster:SetFly( true )
    pMonster:SetX( 2.25 )
    pMonster:SetY( 0.2 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Gaint_BackGround_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame < pMonster:GetLastFrame() ) then
		pMonster:SetInvincible( true )
	end
	
	if( iFrame == 2 ) then
		if( pMonster:FloatRand() < 0.33 ) then
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 3, 0, 0, posx, -0.1 )		-- 문
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 31, 0, 0, posx, -0.1 )	-- 발목 왼
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 10, 0, 0, posx, -0.1 )	-- 팔꿈치 오른
		elseif( pMonster:FloatRand() < 0.66 ) then
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 27, 0, 0, posx, -0.1 )	-- 발목 오른
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 6, 0, 0, posx, -0.1 )		-- 입
		elseif( pMonster:FloatRand() < 0.99 ) then
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 9, 0, 0, posx, -0.1 )		-- 팔꿈치 왼
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 18, 0, 0, posx, -0.1 )	-- 손목 왼
			pMonster:AddTraceParticleToBone( "Giant_Clap_Dust_01", 1.0, 19, 0, 0, posx, -0.1 )	-- 손목 오른
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Gaint_BackGround_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:StartText("DANGER")
		pMonster:SetInvincible( true )
    elseif( iFrame == 70 ) then
		pMonster:EarthQuake( 30, 0.06, 0.02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------
function Gaint_BackGround_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:SetState( "ATTACK01" )
	pMonster:ResetDelay()
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------