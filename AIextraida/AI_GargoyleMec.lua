-- AI_GargoyleMec.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "GargoyleMec_WaitFunc",

        Trigger =
        {
            -- 이동
            {
                AICheckFrame        = 55,
                AIFunc              = "GargoyleMec_Check_Walk",
                DelayFrame          = 220,
            },			
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "GargoyleMec_WalkFunc",
    },
    
    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "Gargoyle_damage.frm",
        Func    = "GargoyleMec_DamageFunc",
    },
 
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Gargoyle_Die01.frm",
        Func    = "GargoyleMec_DieFunc",
    },
    
    -- 죽기착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Gargoyle_Die02.frm",
        Func    = "GargoyleMec_DieLandingFunc",
    },
    
    {
        ID      = "STUN",
        Motion  = "Gargoyle_Wait.frm",
        Func    = "GargoyleMec_StunFunc",
    },
}

CallBack =
{
    Land    = "OnGargoyleMec_Land",
    Die     = "OnGargoyleMec_Die",
    Damage  = "OnGargoyleMec_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitGargoyleMecMec( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function GargoyleMec_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 대기 상태
function GargoyleMec_StunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:InitTimer()
		pMonster:StartTimer()
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetTimer() > 275 ) then
			pMonster:SetState( "WAIT" )
			pMonster:InitTimer()
		else
			pMonster:SetFrameLock( true )
		end
    end
end

-- 이동 상태
function GargoyleMec_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function GargoyleMec_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetInvincible( true )
		pMonster:SetFly( false )
	elseif( iFrame == 8 ) then
	    pMonster:PlaySound(102)       
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState("DIE_LANDING")
    end
end

-- 죽기착지상태
function GargoyleMec_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

--  데미지 상태
function GargoyleMec_DamageFunc( iMonsterIndex, iFrame )
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

function GargoyleMec_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function GargoyleMec_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    --if( pMonster:CheckTargetInRange( 500, -600, 400, 600, -400 ) == true and pMonster:FloatRand() < 0.3 ) then
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    --end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnGargoyleMec_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

function OnGargoyleMec_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnGargoyleMec_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	--pMonster:SetNoCheckContact( 0 )
	--pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
    --pMonster:SetSpeedY( pMonster:GetSpeedY() / 5.0 )

    pMonster:SetPushCheck( true )
end

function GargoyleMec_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetIsContact() == true )then		
        if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.005 )        
            pMonster:SetIsRight( false )
        else
			pMonster:SetSpeedX( 0.005 )        
            pMonster:SetIsRight( true )            
        end    
        
        pMonster:SetState( "WALK" )		
	end
end
