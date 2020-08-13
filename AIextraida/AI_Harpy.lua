-- AI_Harpy.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Harpy_Wait.frm",
        Func    = "Harpy_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "Harpy_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 440,
                AIFunc              = "Harpy_Check_ReleaseTarget",
                DelayFrame          = 880,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 45,
                AIFunc              = "Harpy_Check_TurnToTarget",
                DelayFrame          = 45,
            },
            -- �����̵�
            {
                AICheckFrame        = 100,
                AIFunc              = "Harpy_Check_MoveUp",
                DelayFrame          = 200,
            },
            -- �Ʒ����̵�
            {
                AICheckFrame        = 90,
                AIFunc              = "Harpy_Check_MoveDown",
                DelayFrame          = 90,
            },
            -- ��������
            {
                AICheckFrame        = 110,
                AIFunc              = "Harpy_Check_Attack01",
                DelayFrame          = 220,
            },
            -- �������ֱ�
            {
                AICheckFrame        = 110,
                AIFunc              = "Harpy_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- �����̵�
    {
        ID      = "MOVE_UP",
        Motion  = "Harpy_Wait.frm",
        Func    = "Harpy_MoveUpFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Harpy_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 440,
                AIFunc              = "Harpy_Check_ReleaseTarget",
                DelayFrame          = 880,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "Harpy_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- �Ʒ����̵�
            {
                AICheckFrame        = 25,
                AIFunc              = "Harpy_Check_MoveDown",
                DelayFrame          = 15,
            },
			-- ���߱�
            {
                AICheckFrame        = 20,
                AIFunc              = "Harpy_Check_Stop",
                DelayFrame          = 10,
            },
        }
    },
    
    -- �Ʒ����̵�
    {
        ID      = "MOVE_DOWN",
        Motion  = "Harpy_Wait.frm",
        Func    = "Harpy_MoveDownFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Harpy_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 440,
                AIFunc              = "Harpy_Check_ReleaseTarget",
                DelayFrame          = 880,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "Harpy_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- �����̵�
            {
                AICheckFrame        = 25,
                AIFunc              = "Harpy_Check_MoveUp",
                DelayFrame          = 15,
            },
			-- ���߱�
            {
                AICheckFrame        = 20,
                AIFunc              = "Harpy_Check_Stop",
                DelayFrame          = 10,
            },
        }
    },
    
    -- �������ֱ�
    {
        ID      = "IDLE",
        Motion  = "Harpy_Wait.frm",
        Func    = "Harpy_IdleFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 45,
                AIFunc              = "Harpy_Check_Targeting",
                DelayFrame          = 110,
            },
        }
    },

    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Harpy_Attack01.frm",
        Func    = "Harpy_Attack01Func",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Harpy_Damage_Up.frm",
        Func    = "Harpy_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Harpy_Damage_Down.frm",
        Func    = "Harpy_DamageFunc",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "HarpyQueen_Down01.frm",
        Func    = "Harpy_DieFunc",
    },
    
    -- �ױ�����
    {
        ID      = "DIE_LANDING",
        Motion  = "HarpyQueen_Die02.frm",
        Func    = "Harpy_DieLandingFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Harpy_Stone.frm",
        Func    = "Harpy_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Harpy_Stone.frm",
        Func    = "Harpy_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Harpy_Stone.frm",
		Func	= "Harpy_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnHarpy_Land",
    Die     = "OnHarpy_Die",
    Damage  = "OnHarpy_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitHarpy( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_UP" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    
    --pMonster:SetPushBoundBox( false )
    pMonster:SetFly( true )

end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Harpy_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- ���γ��� ����
function Harpy_MoveUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	pMonster:SetSpeedY( 0.01 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_UP" )
    end
end

-- �Ʒ��γ��� ����
function Harpy_MoveDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	pMonster:SetSpeedY( -0.004 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "MOVE_DOWN" )
    end
end

-- �������ֱ� ����
function Harpy_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
        pMonster:SetState( "IDLE" )
    end
end

-- �ױ����
function Harpy_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound( 52 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ױ���������
function Harpy_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Harpy_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * 19.0 / 20.0 )
	pMonster:SetSpeedY( pMonster:GetSpeedY() * 19.0 / 20.0 )
	
	if( iFrame <= 1 ) then
		--pMonster:PlaySound( 52 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Harpy_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact( 550 )
        pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= 56 and iFrame < 76 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.5)
		pMonster:SetSpeedY( -0.025 )
		
		if( iFrame == 59 ) then
			pMonster:StartAttack( 15, PAR_FRONTDOWN_0, 0.0 )
		elseif( iFrame == 76 ) then
			pMonster:EndAttack()
		end
	elseif( iFrame == 76 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Harpy_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact(0)
        pMonster:SetSuperArmor( true )
        pMonster:SetPushCheck( false )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( false )
        pMonster:SetFly( true )
        pMonster:SetNoCheckContact(550)
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetPushCheck( false )
			pMonster:SetFly( false )
			pMonster:SetNoCheckContact( 0 )
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetSpeedY( 0.01 )
			pMonster:SetState( "DIE" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function Harpy_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact(0)
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
		pMonster:SetFly( true )
        pMonster:SetNoCheckContact(550)
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetPushCheck( false )
			pMonster:SetFly( false )
			pMonster:SetNoCheckContact( 0 )
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetSpeedY( 0.01 )
			pMonster:SetState( "DIE" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function Harpy_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact(0)
        pMonster:SetSuperArmor( true )
        pMonster:SetPushCheck( false )
		pMonster:AddTraceParticleOffset( "Arme01_Hold_Beam_effect_01_Small", 0.0, 0.12, 3 )
		pMonster:AddTraceParticleOffset( "Arme01_Hold_Beam_effect_02_Small", 0.0, 0.12, 3 )
		pMonster:AddTraceParticleOffset( "Arme01_Hold_Beam_effect_03_Small", 0.0, 0.12, 3 )
		pMonster:AddTraceParticleOffset( "Arme01_Hold_Beam_effect_04_Small", 0.0, 0.12, 3 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( false )
        pMonster:SetFly( true )
        pMonster:SetNoCheckContact(550)
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetPushCheck( false )
			pMonster:SetFly( false )
			pMonster:SetNoCheckContact( 0 )
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetSpeedY( 0.01 )
			pMonster:SetState( "DIE" )
		end
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Harpy_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 50, -450, 300, 450, -400 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
        pMonster:ResetDelay()
    end
end

function Harpy_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 100, -1100, 800, 1100, -800 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function Harpy_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Harpy_Check_MoveUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetY() < pMonster:GetTargetY() + 0.15 ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE_UP" )
        pMonster:ResetDelay()
    end
end

function Harpy_Check_MoveDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:GetY() > pMonster:GetTargetY() + 0.15 ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "MOVE_DOWN" )
        pMonster:ResetDelay()
    end
end

function Harpy_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		if( pMonster:GetY() < pMonster:GetTargetY() + 0.15 and pMonster:GetY() > pMonster:GetTargetY() - 0.15 ) then
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetSpeedY( 0.0 )
			pMonster:SetState( "WAIT" )
			pMonster:ResetDelay()
		end
	end
end

function Harpy_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 180, -120, -100, 120, -220 ) == true or pMonster:CheckTargetInRange( 80, -80, -40, 80, -100 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Harpy_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 130, -100, -40, 100, -240 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

-- ������..  
function Harpy_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then        
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnHarpy_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "DIE" ) == true ) then
        pMonster:SetState( "DIE_LANDING" )	
    end
end

function OnHarpy_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetPushCheck( false )
		pMonster:SetFly( false )
		pMonster:SetNoCheckContact( 10 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.02 )
		pMonster:SetState( "DIE" )
	end
	
end

function OnHarpy_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:SetNoCheckContact( 550 )
	
	--pMonster:SetSpeedX( (pMonster:GetSpeedX() )
	pMonster:SetSpeedY( (pMonster:GetSpeedY() * 1.0) / 3.0 )
	--pMonster:SetSpeedX( 0.0 )
	--pMonster:SetSpeedY( 0.0 )
		
end
