-- AI_eventbox.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "miragepot_wait.frm",
        Func    = "miragepot_waitFunc",
    },
    --[[
    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "miragepot_wait.frm",
        Func    = "eventbox_DamageFunc",
    },
	--]]
    
    {
        ID      = "DIE_LANDING",
        Motion  = "miragepot_wait.frm",
        Func    = "eventbox_DieLanding1Func",
    },
    
}

CallBack =
{
    Land    = "Oneventbox_Land",
    Die     = "Oneventbox_Die",
    Damage  = "Oneventbox_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitMiragePot( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetIsRight(true)
	pMonster:AddTraceParticleToBone( "Patu_Spear", 1.0, 0, 8, 8, 0.0, 0.5, true )
pMonster:SetHP( 1 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function miragepot_waitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetIsRight(true)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 꽝
function eventbox_DieLanding1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == pMonster:GetLastFrame() - 1 ) then
		local posx = 0.0
		local posy = 0.5
		pMonster:AddParticle("Patu_Spear_Spark_01" , posx, posy)
		pMonster:AddParticle("Patu_Spear_Spark_02" , posx, posy)
		pMonster:AddParticle("Patu_Spear_Spark_03" , posx, posy)
		pMonster:AddParticle("Patu_Spear_Spark_04" , posx, posy)
		pMonster:AddParticle("Patu_Spear_Spark_05" , posx, posy)
		pMonster:AddParticle("Patu_Spear_Spark_06" , posx, posy)
		pMonster:AddParticle("Patu_Spear_Spark_07" , posx, posy)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

--  데미지 상태
function eventbox_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
    
    if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Oneventbox_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

function Oneventbox_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE_LANDING" )
end

function Oneventbox_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetSpeedX( 0.0)
    pMonster:SetSpeedY( 0.0 )

    pMonster:SetPushCheck( true )
end