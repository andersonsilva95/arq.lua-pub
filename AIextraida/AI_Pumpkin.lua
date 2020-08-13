-- AI_Pumpkin.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Pumpkin_Wait.frm",
        Func    = "Pumpkin_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 15,
                AIFunc              = "Pumpkin_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟지움
            {
                AICheckFrame        = 440,
                AIFunc              = "Pumpkin_Check_ReleaseTarget",
                DelayFrame          = 880,
            },
            -- 걷기
            {
                AICheckFrame        = 75,
                AIFunc              = "Pumpkin_Check_Walk",
                DelayFrame          = 110,
            },
        },
    },
    
     -- 이동
    {
        ID      = "WALK",
        Motion  = "Pumpkin_Walk.frm",
        Func    = "Pumpkin_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Pumpkin_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "Pumpkin_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 폭발
            {
                AICheckFrame        = 15,
                AIFunc              = "Pumpkin_Check_Explosion",
                DelayFrame          = 55,
            },--[[
            -- 정지
            {
                AICheckFrame        = 35,
                AIFunc              = "Paraminimi_Check_Stop",
                DelayFrame          = 35,
            },  --]]          
        }
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Pumpkin_Die.frm",
        Func    = "Pumpkin_DieFunc",
    },
}

CallBack =
{
    Land    = "OnPumpkin_Land",
    Die     = "OnPumpkin_Die",
    Damage  = "OnPumpkin_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitPumpkin( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetRight( true )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Pumpkin_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function Pumpkin_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기상태
function Pumpkin_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetInvincible( true )
        pMonster:SetSuperArmor(true)
	elseif( iFrame == 61 ) then
		pMonster:AddParticle( "Pumpkin_Boom01", 0.0, 0.17 )
		pMonster:AddParticle( "Pumpkin_Boom02", 0.0, 0.17 )
		pMonster:AddParticle( "Pumpkin_Boom03", 0.0, 0.17 )
		pMonster:AddParticle( "Pumpkin_Boom04", 0.0, 0.17 )
		pMonster:AddDamage( DT_MONSTER_PUMPKIN01 )
		pMonster:PlaySound( 43 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then		
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Pumpkin_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 50, -450, 300, 450, -400 ) == true ) then
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
        pMonster:ResetDelay()
    end
end

function Pumpkin_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1300, 1100, 1300, -1100 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end


function Pumpkin_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 50, -50, 100, 50, -100 ) == false ) then
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Pumpkin_Check_Explosion( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -150, 150, 150, -100 ) == true ) then
		pMonster:SetState( "DIE" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnPumpkin_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
end

function OnPumpkin_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.00 )
	pMonster:SetState( "DIE" )
end

function OnPumpkin_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
end

function Pumpkin_MoveFail( iMonsterIndex )
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

