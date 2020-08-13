-- AI_Paraminimi.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "potato_mon_wait.frm",
        Func    = "Paraminimi_WaitFunc",

        Trigger =
        {
            
        
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Paraminimi_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Paraminimi_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            
			-- �����̵�
            {
                AICheckFrame        = 55,
                AIFunc              = "Paraminimi_Check_MoveUp",
                DelayFrame          = 220,
            },
            -- �̵�
            {
                AICheckFrame        = 55,
                AIFunc              = "Paraminimi_Check_Walk",
                DelayFrame          = 220,
            },			
			-- �Ʒ����̵�
            {
                AICheckFrame        = 75,
                AIFunc              = "Paraminimi_Check_MoveDown",
                DelayFrame          = 220,
            },
            -- ��������
            {
                AICheckFrame        = 45,
                AIFunc              = "Paraminimi_Check_Attack01",
                DelayFrame          = 110,
            },
            
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "potato_mon_walk.frm",
        Func    = "Paraminimi_WalkFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Paraminimi_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ����
            {
                AICheckFrame        = 1,
                AIFunc              = "Paraminimi_Check_Stop",
                DelayFrame          = 0,
            },            
        }
    },
	
	-- �����̵�
    {
        ID      = "MOVE_UP",
        Motion  = "potato_mon_wait.frm",
        Func    = "Paraminimi_MoveUpFunc",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Paraminimi_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ����
            {
                AICheckFrame        = 1,
                AIFunc              = "Paraminimi_Check_MoveUpStop",
                DelayFrame          = 0,
            },            
        }
    },
	
	-- �Ʒ����̵�
    {
        ID      = "MOVE_DOWN",
        Motion  = "potato_mon_wait.frm",
        Func    = "Paraminimi_MoveDownFunc",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Paraminimi_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ����
            {
                AICheckFrame        = 1,
                AIFunc              = "Paraminimi_Check_MoveDownStop",
                DelayFrame          = 0,
            },            
        }
    },
    
    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "potato_mon_attack_01.frm",
        Func    = "Paraminimi_Attack01Func",
    },
    
    -- ��������01
    {
        ID      = "ATTACK02",
        Motion  = "potato_mon_deep_impact_attack.frm",
        Func    = "Paraminimi_Attack02Func",
    },
        
    
    -- ������
    {
        ID      = "DAMAGE",
        Motion  = "Paraminimi_Damage.frm",
        Func    = "Paraminimi_DamageFunc",
    },
 
    -- �ױ�
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
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitParaminimi( iMonsterIndex )
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
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Paraminimi_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �̵� ����
function Paraminimi_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �����̵� ����
function Paraminimi_MoveUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedY( 0.015 )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �Ʒ����̵� ����
function Paraminimi_MoveDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedY( -0.015 )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �״»���
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

--  ������ ����
function Paraminimi_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  �������� ����
function Paraminimi_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetPushCheck( false )
	elseif( iFrame == 19 ) then       
		pMonster:StartAttack( 6, PAR_DOWN,0.05, 0,1, 5 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Paraminimi_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    
    if( iFrame <= 1) then
		pMonster:SetSuperArmor( true )
		pMonster:SetPushCheck( false )
    elseif( iFrame == 21 ) then 
		pMonster:SetSpeedY( 0.05 )
		pMonster:SetNoCheckContact( 70 )
    elseif( iFrame == 60 ) then 
		pMonster:SkillReadyEffect( 255 , 0 , 0 )
    
    
	elseif( iFrame == 68 ) then 	    
	    
	    if( pMonster:GetIsRight() ) then
	        pMonster:AddDamage( 1584 )	    
	    else
	        pMonster:AddDamage( 1585 )	    
	    end
	    
	    if( pMonster:GetIsRight() ) then	
            pMonster:SetSpeedX( 0.05 )
        else
            pMonster:SetSpeedX( -0.05 )
        end				    
	elseif( iFrame == 71 ) then        	
	    pMonster:SetSpeedY( -0.08 )		
	    pMonster:ToggleRender( false )	
	elseif( iFrame >= 79 and pMonster:GetIsContact() == true ) then        	
	    pMonster:SetState( "WAIT" )
        pMonster:SetSpeedX( 0 )
        pMonster:SetPushCheck( true )
        pMonster:ToggleRender( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:ToggleRender( true )
        
    end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Paraminimi_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
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

    if( pMonster:CheckTargetInRange( 500, -600, 400, 600, -400 ) == true and pMonster:FloatRand() < 0.3 ) then
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Paraminimi_Check_MoveUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -900, 900, 900, 50 ) == true and pMonster:FloatRand() < 0.3 ) then
        pMonster:SetState( "MOVE_UP" )
        pMonster:ResetDelay()
    end
end

function Paraminimi_Check_MoveDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -900, -50, 900, -900 ) == true and pMonster:FloatRand() < 0.3 ) then
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

    if( pMonster:CheckTargetInRange( 150, -150, 50, 150, -50 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnParaminimi_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    --pMonster:SetSpeedY( 0.05 )
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
