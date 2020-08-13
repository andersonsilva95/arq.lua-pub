-- AI_Paraminimi.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Paraminimi_Wait.frm",
        Func    = "Paraminimi_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 50,
                AIFunc              = "Paraminimi_Check_Targeting",
                DelayFrame          = 80,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "Paraminimi_Check_TurnToTarget",
                DelayFrame          = 110,
            },

			-- 위로이동
            {
                AICheckFrame        = 100,
                AIFunc              = "Paraminimi_Check_MoveUp",
                DelayFrame          = 100,
            },
            -- 이동
            {
                AICheckFrame        = 120,
                AIFunc              = "Paraminimi_Check_Walk",
                DelayFrame          = 100,
            },			
			-- 아래로이동
            {
                AICheckFrame        = 100,
                AIFunc              = "Paraminimi_Check_MoveDown",
                DelayFrame          = 100,
            },
            -- 근접공격
            {
                AICheckFrame        = 80,
                AIFunc              = "Paraminimi_Check_Attack01",
                DelayFrame          = 160,
            },

            -- 선풍기
            {
                AICheckFrame        = 120,
                AIFunc              = "Paraminimi_Check_Attack02",
                DelayFrame          = 240,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "Paraminimi_Wait.frm",
        Func    = "Paraminimi_WalkFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "Paraminimi_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 정지
            {
                AICheckFrame        = 2,
                AIFunc              = "Paraminimi_Check_Stop",
                DelayFrame          = 1,
            },            
        }
    },
	
	-- 위로이동
    {
        ID      = "MOVE_UP",
        Motion  = "Paraminimi_Wait.frm",
        Func    = "Paraminimi_MoveUpFunc",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "Paraminimi_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 정지
            {
                AICheckFrame        = 2,
                AIFunc              = "Paraminimi_Check_MoveUpStop",
                DelayFrame          = 1,
            },            
        }
    },
	
	-- 아래로이동
    {
        ID      = "MOVE_DOWN",
        Motion  = "Paraminimi_Wait.frm",
        Func    = "Paraminimi_MoveDownFunc",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "Paraminimi_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 정지
            {
                AICheckFrame        = 2,
                AIFunc              = "Paraminimi_Check_MoveDownStop",
                DelayFrame          = 1,
            },            
        }
    },
    
    -- 빠~빠~빠이어볼
    {
        ID      = "ATTACK01",
        Motion  = "Paraminimi_Attack01.frm",
        Func    = "Paraminimi_Attack01Func",
    },
    
    -- 회전 불 회오리~
    {
        ID      = "ATTACK02",
        Motion  = "MagmaParadom_Fan.frm",
        Func    = "Paraminimi_Attack02Func",
    },
    
    -- 데미지
    {
        ID      = "DAMAGE",
        Motion  = "Paraminimi_Damage.frm",
        Func    = "Paraminimi_DamageFunc",
    },
 
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Paraminimi_Die.frm",
        Func    = "Paraminimi_DieFunc",
    },
}

CallBack =
{
    Land    = "OnParaminimi_Land",
    Die     = "OnParaminimi_Die",
    Damage  = "OnParaminimi_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitMagmaParadom( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )

    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "DAMAGE" )
	
	pMonster:SetFly( true )

end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Paraminimi_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 이동 상태
function Paraminimi_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 위로이동 상태
function Paraminimi_MoveUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedY( 0.015 )
    pMonster:SetSuperArmor( true )    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 아래로이동 상태
function Paraminimi_MoveDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedY( -0.015 )
    pMonster:SetSuperArmor( true )     
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function Paraminimi_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetInvincible( true )
		pMonster:SetFly( false )
	elseif( iFrame == 8 ) then
	    pMonster:PlaySound(102)       
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

--  데미지 상태
function Paraminimi_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  빠~빠~빠이어볼
function Paraminimi_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    local particleX = 0.0
    if( pMonster:GetIsRight() == false ) then
		particleX = -0.6
	end
    
    if( iFrame <= 1) then
			pMonster:SetSuperArmor( true )
	elseif( iFrame == 56 ) then 
		pMonster:AddParticleNoDirection( "Magmaparadom_Shot_01", particleX, 0.3 )    
		pMonster:AddParticleNoDirection( "Magmaparadom_Shot_02", particleX, 0.3 )    
		pMonster:PlaySound( 998015 )
	elseif( iFrame == 61 ) then        
	
		if( pMonster:GetIsRight() ) then
	        pMonster:SetSpeedX( -0.005 )
	    else
	        pMonster:SetSpeedX( 0.005 )
	    end
		
		pMonster:AddDamageWithLocate( DT_MAGMA_PARADOM_FIREBALL, 0.2, 0.17 )
    elseif( iFrame == 66 ) then 
		pMonster:AddParticleNoDirection( "Magmaparadom_Shot_01", particleX, 0.3 )    
		pMonster:AddParticleNoDirection( "Magmaparadom_Shot_02", particleX, 0.3 )    
		pMonster:PlaySound( 998015 )
	elseif( iFrame == 71 ) then        
	
		if( pMonster:GetIsRight() ) then
	        pMonster:SetSpeedX( -0.005 )
	    else
	        pMonster:SetSpeedX( 0.005 )
	    end
		
		pMonster:AddDamageWithLocate( DT_MAGMA_PARADOM_FIREBALL, 0.2, 0.17 )
	elseif( iFrame == 76 ) then 
		pMonster:AddParticleNoDirection( "Magmaparadom_Shot_01", particleX, 0.3 )    
		pMonster:AddParticleNoDirection( "Magmaparadom_Shot_02", particleX, 0.3 )    
		pMonster:PlaySound( 998015 )
	elseif( iFrame == 81 ) then        
	
		if( pMonster:GetIsRight() ) then
	        pMonster:SetSpeedX( -0.005 )
	    else
	        pMonster:SetSpeedX( 0.005 )
	    end
		
		pMonster:AddDamageWithLocate( DT_MAGMA_PARADOM_FIREBALL, 0.2, 0.17 )
	elseif( iFrame == 81 ) then        
        pMonster:SetSpeedX( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  회전 불회오리
function Paraminimi_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 6 ) then
		pMonster:PlaySound( 998014 )
	    pMonster:AddDamage( DT_MAGMA_PARADOM_FAN_ATK )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Paraminimi_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 300, 400, -300 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Paraminimi_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Paraminimi_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -400, 300, 400, -400 ) == true and pMonster:FloatRand() < 0.5 ) then
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Paraminimi_Check_MoveUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -400, 400, 400, 60 ) == true and pMonster:FloatRand() < 0.5 ) then
        pMonster:SetState( "MOVE_UP" )
        pMonster:ResetDelay()
    end
end

function Paraminimi_Check_MoveDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -400, -60, 400, -400 ) == true and pMonster:FloatRand() < 0.5 ) then
        pMonster:SetState( "MOVE_DOWN" )
        pMonster:ResetDelay()
    end
end

function Paraminimi_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -120, 100, 120, -100 ) == true or pMonster:CheckTargetInRange( 560, -400, 400, 400, -400 ) == false ) then
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
end

function Paraminimi_Check_MoveUpStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -120, 40, 120, -40 ) == true or pMonster:CheckTargetInRange( 0, -900, 900, 900, 50 ) == false ) then
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
end

function Paraminimi_Check_MoveDownStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -120, 40, 120, -40 ) == true or pMonster:CheckTargetInRange( 0, -900, -50, 900, -900 ) == false ) then
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
end

function Paraminimi_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 250, -200, 70, 200, -50 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Paraminimi_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -200, 210, 200, -200 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnParaminimi_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

function OnParaminimi_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnParaminimi_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
    pMonster:SetSpeedY( pMonster:GetSpeedY() / 5.0 )

    pMonster:SetPushCheck( true )

	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE" )
	end
end

function Paraminimi_MoveFail( iMonsterIndex )
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
