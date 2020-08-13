-- AI_Mongban.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Mongban_Wait.frm",
        Func    = "Mongban_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Mongban_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "Mongban_Check_ReleseTarget",
                DelayFrame          = 440,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Mongban_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- �ȱ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Mongban_Check_Walk",
                DelayFrame          = 55,
            },
            -- ��������01
            {
                AICheckFrame        = 55,
                AIFunc              = "Mongban_Check_Attack01",
                DelayFrame          = 55,
            },
            -- ����Ʈ���ʵ�
            {
                AICheckFrame        = 110,
                AIFunc              = "Mongban_Check_Attack04",
                DelayFrame          = 220,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "Mongban_Check_HighJump",
                DelayFrame          = 55,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 220,
                AIFunc              = "Mongban_Check_JumpDown",
                DelayFrame          = 220,
            },
            -- ������(�̵�)
            {
                AICheckFrame        = 110,
                AIFunc              = "Mongban_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Mongban_Walk.frm",
        Func    = "Mongban_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Mongban_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Mongban_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "Mongban_Check_ReleseTarget",
                DelayFrame          = 440,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Mongban_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "Mongban_Check_HighJump",
                DelayFrame          = 55,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 35,
                AIFunc              = "Mongban_Check_JumpDown",
                DelayFrame          = 0,
            },
            -- ��������01
            {
                AICheckFrame        = 25,
                AIFunc              = "Mongban_Check_Attack01",
                DelayFrame          = 110,
            },
            -- �����ũ
            {
                AICheckFrame        = 45,
                AIFunc              = "Mongban_Check_Attack03",
                DelayFrame          = 220,
            },
			-- ���߱�
            {
                AICheckFrame        = 55,
                AIFunc              = "Mongban_Check_WalkStop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- ������
    {
        ID      = "IDLE",
        Motion  = "Mongban_Wait.frm",
        Func    = "Mongban_IdleFunc",
        
         Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Mongban_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ������(����)
            {
                AICheckFrame        = 440,
                AIFunc              = "Mongban_Check_Idle_Stop",
                DelayFrame          = 440,
            },
        }
    },
    
    -- ����01
    {
        ID      = "ATTACK01",
        Motion  = "Mongban_Attack01.frm",
        Func    = "Mongban_Attack01Func",
    },
    
    -- ����03
    {
        ID      = "ATTACK03",
        Motion  = "Mongban_Attack03.frm",
        Func    = "Mongban_Attack03Func",
    },
    
    -- ����04
    {
        ID      = "ATTACK04",
        Motion  = "Mongban_Attack04.frm",
        Func    = "Mongban_Attack04Func",
    },
    
    -- �ʻ��
    {
        ID      = "SPECIAL_ATTACK",
        Motion  = "Mongban_SpecialAttack.frm",
        Func    = "Mongban_SpecialAttackFunc",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Mongban_Jump.frm",
        Func    = "Mongban_JumpFunc",
    },

    -- ��������
    {
        ID      = "HIGHJUMP",
        Motion  = "Mongban_HighJump.frm",
        Func    = "Mongban_HighJumpFunc",
    },
    
    -- ��������
    {
        ID      = "JUMP_LANDING",
        Motion  = "Mongban_JumpLanding.frm",
        Func    = "Mongban_JumpLandingFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Mongban_Damage_Up.frm",
        Func    = "Mongban_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Mongban_Damage_Middle.frm",
        Func    = "Mongban_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Mongban_Damage_Down.frm",
        Func    = "Mongban_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID                  = "DOWN_UP01",
        Motion              = "Mongban_Down_Up01.frm",
        Func                = "Mongban_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Mongban_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID                  = "DOWN_UP02",
        Motion              = "Mongban_Down_Up02.frm",
        Func                = "Mongban_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID                  = "DOWN_UP_LANDING",
        Motion              = "Mongban_Down_Up03.frm",
        Func                = "Mongban_DownUp03Func",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Mongban_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Mongban_Down_Middle.frm",
        Func    = "Mongban_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Mongban_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Mongban_Die01.frm",
        Func    = "Mongban_DieFunc",
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Mongban_Die02.frm",
        Func    = "Mongban_DieLandingFunc",
    },

    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Mongban_Standup.frm",
        Func    = "Mongban_StandupFunc",
    },
    
    -- ����
    {
        ID      = "GUARD",
        Motion  = "Mongban_Guard.frm",
        Func    = "Mongban_GuardFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Mongban_Stone.frm",
        Func    = "Mongban_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Mongban_Stone.frm",
        Func    = "Mongban_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Mongban_Stone.frm",
		Func	= "Mongban_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnMongban_Land",
    Die     = "OnMongban_Die",
    Damage  = "OnMongban_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitMongban( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_MIDDLE" )

    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Mongban_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �ȱ� ����
function Mongban_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function Mongban_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end


-- �״»���
function Mongban_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
        --pMonster:SetState( "DIE_LANDING" )
        pMonster:EndMonster()
    end
end

-- �״»��� ����
function Mongban_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Mongban_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function Mongban_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function Mongban_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function Mongban_DownUp03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
	pMonster:PlaySound(48)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )                
        
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE_LANDING" )
        end        
    end
end

-- �ٿ�
function Mongban_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
		pMonster:PlaySound(48)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )				
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end		
    end
end

-- �Ͼ��
function Mongban_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  ����01 ����
function Mongban_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 56) then		
		pMonster:PlaySound(244)
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( 0.012 )
		else
			pMonster:SetSpeedX( -0.012 )
		end	
		pMonster:AddDamage( DT_MONSTER_MONGBAN01_01 )

	elseif( iFrame == 81) then
		pMonster:PlaySound(244)	
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( 0.012 )
		else
			pMonster:SetSpeedX( -0.012 )
		end	
		pMonster:AddDamage( DT_MONSTER_MONGBAN01_02 )

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��������
function Mongban_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 51) then		
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( 0.015 )
		else
			pMonster:SetSpeedX( -0.015 )
		end	
		
		pMonster:SetNoCheckContact(15)
		pMonster:SetSpeedY( 0.022 )
		
	elseif( iFrame == 79) then		
		pMonster:StartAttack( 15, PAR_DOWN, 0.0 )
	elseif( iFrame == 82 ) then
		pMonster:EndAttack()
		pMonster:EarthQuakeWithRange( 25, 0.06, 0.03, 0.75 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����04 ����
function Mongban_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 60 ) then
	    pMonster:PlaySound( 41 )
	    pMonster:AddDamage( DT_MONGBAN_LIGHTING_FIELD )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �ʻ�� ����
function Mongban_SpecialAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 61 ) then
		pMonster:AddDamage( DT_MONGBAN_CANNON )
	elseif( iFrame == 77 ) then
		pMonster:AddDamage( DT_MONGBAN_CANNON )
	elseif( iFrame == 93 ) then
		pMonster:AddDamage( DT_MONGBAN_CANNON )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  �������� ����
function Mongban_HighJumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )				
    end

end

--  ���� ����
function Mongban_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )				
    end

end

--  �������� ����
function Mongban_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )				
    end

end

--  ���� ����
function Mongban_GuardFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Mongban_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetInvincible( true )
        pMonster:SetPushCheck( false )
        pMonster:AddTraceParticle( "StoneCurse_medium", 0, 3 )
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetPushCheck( true )
        pMonster:SetInvincible( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function Mongban_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_medium", 3 )
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function Mongban_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Middle", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Mongban_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -300 ) == true ) then
		
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function Mongban_Check_ReleseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -500, 400, 500, -300 ) == false ) then		
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function Mongban_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Mongban_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Mongban_Check_WalkStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 70, -80, 100, 80, -100 ) == true or pMonster:FloatRand() < 0.2) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function Mongban_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 120, 500, -150 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "RUN" )
        pMonster:ResetDelay()
    end
end

function Mongban_Check_RunStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -500, 200, 500, -100 ) == false ) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function Mongban_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 100, 100, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Mongban_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -100, 200, 100, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Mongban_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    pMonster:SetCountValue( 3 )

    if( pMonster:CheckTargetInRange( 0, -300, 300, 300, -200 ) == true and pMonster:GetCountValue() >= 3 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Mongban_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function Mongban_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 400, 100, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Mongban_Jump( iMonsterIndex )
		pMonster:SetState( "HIGHJUMP" )
		pMonster:ResetDelay()
    end
end

function Mongban_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, -60, 100, -300 ) == true ) then
		pMonster:SetNoCheckContact(20)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Mongban_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function Mongban_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function Mongban_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnMongban_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
        pMonster:SetState( "JUMP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    end
end

function OnMongban_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()
	
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.02 )
		else
			pMonster:SetSpeedX( 0.02 )
		end	
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnMongban_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:SetNoCheckContact(0)
	pMonster:SetSpeedX( (pMonster:GetSpeedX() * 9.0 ) / 10.0 )
	pMonster:SetSpeedY( (pMonster:GetSpeedY() * 2.0 ) / 3.0 )
    
	if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
        if( pMonster:IsSuperArmor() == false ) then
            pMonster:SetNoCheckContact( 5 )
        end
	end
    
	if( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
	
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		if( pMonster:CheckState( "DAMAGE_UP" ) or pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.028 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DAMAGE_DOWN" ) ) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.019 )			
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -2.0 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_UP02" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )			
		end	
	end
end

function Mongban_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Mongban_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )			
		end
	end
end