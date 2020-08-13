-- AI_GiantDrillmon.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Drillmon_Wait.frm",
        Func    = "GiantDrillmon_WaitFunc",


		-- �������ϵ��� ����ɼ� �ִ� Ʈ���ŵ��� �����Ѵ�.
		
        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 55,                            -- �󸶳� ���� ������ Ʈ���Ÿ� üũ�� �������� ��ġ�� �Է�(������)
                AIFunc              = "GiantDrillmon_Check_Targeting",      -- Ʈ���Ű� üũ�Ǿ����� ����� ������ �Լ��� �̸��� �Է�(���������� �Է��ϴ� �Լ�)
                DelayFrame          = 110,                           -- ����� ����Ǿ����� Ʈ���� üũ�� �󸶵��� ���� �������� ��ġ�� �Է�
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "GiantDrillmon_Check_ReleaseTarget",
                DelayFrame          = 550,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 45,
                AIFunc              = "GiantDrillmon_Check_TurnToTarget",
                DelayFrame          = 45,
            },
            -- �ȱ�
            {
                AICheckFrame        = 55,
                AIFunc              = "GiantDrillmon_Check_Walk",
                DelayFrame          = 55,
            },                    
            -- ������
            {
                AICheckFrame        = 55,
                AIFunc              = "GiantDrillmon_Check_JumpUp",
                DelayFrame          = 75,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 75,
                AIFunc              = "GiantDrillmon_Check_JumpDown",
                DelayFrame          = 75,
            },           
            -- ��������
            {
                AICheckFrame        = 100,
                AIFunc              = "GiantDrillmon_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ��ġ�����
            {
                AICheckFrame        = 180,
                AIFunc              = "GiantDrillmon_Check_Attack02",
                DelayFrame          = 330,
            },
            -- �������� ����
            {
                AICheckFrame        = 55,
                AIFunc              = "GiantDrillmon_Check_Attack03",
                DelayFrame          = 220,
            },
            -- �帱����
            {
                AICheckFrame        = 85,
                AIFunc              = "GiantDrillmon_Check_Attack04",
                DelayFrame          = 550,
            },
        },
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Drillmon_Walk.frm",
        Func            = "GiantDrillmon_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "GiantDrillmon_MoveFail",


        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "GiantDrillmon_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 110,
                AIFunc              = "GiantDrillmon_Check_ReleaseTarget",
                DelayFrame          = 330,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 25,
                AIFunc              = "GiantDrillmon_Check_TurnToTarget",
                DelayFrame          = 25,
            },
            -- ������
            {
                AICheckFrame        = 55,
                AIFunc              = "GiantDrillmon_Check_JumpUp",
                DelayFrame          = 55,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 220,
                AIFunc              = "GiantDrillmon_Check_JumpDown",
                DelayFrame          = 220,
            },
            -- ��������
            {
                AICheckFrame        = 100,
                AIFunc              = "GiantDrillmon_Check_Attack01",
                DelayFrame          = 220,
            },
            -- ��ġ�����
            {
                AICheckFrame        = 100,
                AIFunc              = "GiantDrillmon_Check_Attack02",
                DelayFrame          = 220,
            },  
			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "GiantDrillmon_Check_Stop",
                DelayFrame          = 10,
            },
        }
    },

    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Drillmon_Attack01.frm",
        Func    = "GiantDrillmon_Attack01Func",
    },

    -- ��ġ��
    {
        ID      = "ATTACK02",
        Motion  = "Drillmon_Attack02.frm",
        Func    = "GiantDrillmon_Attack02Func",
    },
    
    -- ����������
    {
        ID      = "ATTACK03",
        Motion  = "Drillmon_Attack03.frm",
        Func    = "GiantDrillmon_Attack03Func",
    },
    
    -- �帱����
    {
        ID      = "ATTACK04",
        Motion  = "Drillmon_Attack04.frm",
        Func    = "GiantDrillmon_Attack04Func",
    },

    -- ����
    {
        ID      = "JUMP",
        Motion  = "Drillmon_Jump.frm",
        Func    = "GiantDrillmon_JumpFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Drillmon_Damage_Up.frm",
        Func    = "GiantDrillmon_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Drillmon_Damage_Middle.frm",
        Func    = "GiantDrillmon_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Drillmon_Damage_Down.frm",
        Func    = "GiantDrillmon_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID                  = "DOWN_UP01",
        Motion              = "Drillmon_Down_Up01.frm",
        Func                = "GiantDrillmon_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "GiantDrillmon_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID                  = "DOWN_UP02",
        Motion              = "Drillmon_Down_Up02.frm",
        Func                = "GiantDrillmon_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID                  = "DOWN_UP_LANDING",
        Motion              = "Drillmon_Down_Up03.frm",
        Func                = "GiantDrillmon_DownUp03Func",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "GiantDrillmon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID                  = "DOWN_MIDDLE",
        Motion              = "Drillmon_Down_Middle.frm",
        Func                = "GiantDrillmon_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "GiantDrillmon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- �ٿ� ��
    {
        ID                  = "DOWN_DOWN",
        Motion              = "Drillmon_Down02.frm",
        Func                = "GiantDrillmon_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "GiantDrillmon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID                  = "DOWN_SPECIAL",
        Motion              = "Drillmon_Down_Special01.frm",
        Func                = "GiantDrillmon_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID                  = "DOWN_SPECIAL_LANDING",
        Motion              = "Drillmon_Down_Special02.frm",
        Func                = "GiantDrillmon_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "GiantDrillmon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID                  = "DIE",
        Motion              = "Drillmon_Die01.frm",
        Func                = "GiantDrillmon_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID                  = "DIE_LANDING",
        Motion              = "Drillmon_Die02.frm",
        Func                = "GiantDrillmon_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },

    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Drillmon_Standup.frm",
        Func    = "GiantDrillmon_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Drillmon_Stone.frm",
        Func    = "GiantDrillmon_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Drillmon_Stone.frm",
        Func    = "GiantDrillmon_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Drillmon_Stone.frm",
		Func	= "GiantDrillmon_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnGiantDrillmon_Land",
    Die     = "OnGiantDrillmon_Die",
    Damage  = "OnGiantDrillmon_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitGiantDrillmon( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,           "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE,       "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,         "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,             "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,         "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,           "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,         "DOWN_SPECIAL" )

    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function GiantDrillmon_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function GiantDrillmon_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �޸��� ����
function GiantDrillmon_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- �״»���
function GiantDrillmon_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound(100)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LANDING" )
    end
end

-- �״»��� ����
function GiantDrillmon_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function GiantDrillmon_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function GiantDrillmon_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function GiantDrillmon_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function GiantDrillmon_DownUp03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 5 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )                
        
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE_LANDING" )
        end        
    end
end

-- �ٿ� �̵�
function GiantDrillmon_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )                
        
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE_LANDING" )
        end        
    end
end

-- �ٿ� �ٿ�
function GiantDrillmon_DownDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 7 ) then
        pMonster:SetSpeedX( pMonster:GetSpeedX() / 5 )
        pMonster:SetSpeedY( 0.032 )        
    elseif( iFrame >= pMonster:GetLastFrame() ) then
            pMonster:SetState( "DOWN_UP01" )
    end
end

-- �ٿ� �����
function GiantDrillmon_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function GiantDrillmon_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE_LANDING" )
        end
    end
end

-- �Ͼ��
function GiantDrillmon_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function GiantDrillmon_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 48 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
    elseif( iFrame == 50 ) then
        pMonster:AddDamage( DT_MONSTER_GIANTDRILLMON01 )
		pMonster:PlaySound(99)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��ġ�� ����
function GiantDrillmon_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame < 21 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -0.3 )
			
		if( iFrame <= 1 ) then
			pMonster:SetSuperArmor( true )
		end
		
	elseif( iFrame == 61 ) then	
		pMonster:AddDamage( DT_MONSTER_GIANTDRILLMON02 )	
	elseif( iFrame == 69 ) then
		pMonster:SetFly( true )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 7.0 )
	elseif( iFrame == 92 ) then
		pMonster:SetFly( false )	
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 3.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ������������
function GiantDrillmon_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:TurnToTarget()
	elseif( iFrame == 21 ) then
		pMonster:AddParticle( "fireball_start_01", 0.0, 0.8 )
		pMonster:AddParticle( "fireball_start_02", 0.0, 0.8 )
		pMonster:AddParticle( "fireball_start_03", 0.0, 0.8 )
	elseif( iFrame == 31 ) then
        pMonster:ComputeAngleToTarget( 0.0, 0.0 ) -- Ÿ�������� ������ ���
        pMonster:AddParticle( "fireball_effect_01", 0.0, 0.8 )
		pMonster:AddParticle( "fireball_effect_02", 0.0, 0.8 )
	elseif( iFrame == 51 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON04_01, pMonster:GetAngleToTarget() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �帱����
function GiantDrillmon_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.0 ) -- Ÿ�������� ������ ���
		pMonster:SetSuperArmor( true )
		pMonster:StartText( "DANGER" )
		pMonster:PlaySound( "129" )
	elseif( iFrame == 51 ) then
		pMonster:AddParticle( "Drill_Splinter01", 0.0, 0.0 )		
		pMonster:AddParticle( "Drill_Splinter02", 0.0, 0.0 )		
		pMonster:PlaySound(98)
	elseif( iFrame == 55 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, 1.177 )
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, -2.747 )
	elseif( iFrame == 73 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, 2.355 )
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, -0.412 )
		pMonster:PlaySound(98)
	elseif( iFrame == 91 ) then		
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, 2.747 )
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, -0.300 )		
	elseif( iFrame == 109 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, 1.691 )
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, -1.177 )
	elseif( iFrame == 127 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, 0.100 )
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, -1.691 )
		pMonster:PlaySound(98)
	elseif( iFrame == 145 ) then		
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, 0.412 )
		pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, -2.355 )
		
		--pMonster:AddDamageWithAngle( DT_MONSTER_GIANTDRILLMON03, Angle2 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function GiantDrillmon_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ����Ŀ�� �ɷ���
function GiantDrillmon_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:SetNoCheckContact(0)
        pMonster:AddTraceParticle( "StoneCurse_medium", 3 )
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function GiantDrillmon_IceCurseFunc( iMonsterIndex, iFrame )
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
function GiantDrillmon_HoldFunc( iMonsterIndex, iFrame )
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

function GiantDrillmon_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function GiantDrillmon_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function GiantDrillmon_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
        pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function GiantDrillmon_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function GiantDrillmon_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 240, 160, -320 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function GiantDrillmon_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function GiantDrillmon_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -100, 100, 100, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function GiantDrillmon_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 400, -100, 150, 100, -100 ) == true and pMonster:GetCountValue() >= 3 ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function GiantDrillmon_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -200, 400, 200, -300 ) == true and pMonster:GetCountValue() >= 1 ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function GiantDrillmon_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:IsTarget() == true and pMonster:GetCountValue() >= 5 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function GiantDrillmon_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:AddCountValue(1)	
		GiantDrillmon_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function GiantDrillmon_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -300 ) == true ) then
		pMonster:AddCountValue(1)	
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )			
		pMonster:ResetDelay()
	end
end

function GiantDrillmon_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function GiantDrillmon_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function GiantDrillmon_Check_Idle_Stop( iMonsterIndex, iFrame )
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
function OnGiantDrillmon_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (1.0 / 2.0) )

    if( pMonster:CheckState( "JUMP" ) == true ) then
        pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_SPECIAL_LANDING" )
    end
end

function OnGiantDrillmon_Die( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
        pMonster:TurnToTarget()

        if( pMonster:GetIsRight() == true ) then
            pMonster:SetSpeedX( -0.02 )
        else
            pMonster:SetSpeedX( 0.02 )
        end

        pMonster:SetState( "DIE" )
    end
    
end

function OnGiantDrillmon_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:AddCountValue(1)
	pMonster:SetPushCheck( true )
	pMonster:SetSpeedX( (pMonster:GetSpeedX() * 9.0 ) / 10.0 )
    pMonster:SetSpeedY( ( pMonster:GetSpeedY() * 9.0 ) / 10.0 )
	
    if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
    
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
		
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		if( pMonster:CheckState( "DAMAGE_UP" ) or pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.032 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DAMAGE_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -4.0 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_MIDDLE" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )			
		end	
	end
	
    if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK02" )
		end
    end
end

function GiantDrillmon_Jump( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    local fTargetX = pMonster:GetTargetX()
    local fTargetY = pMonster:GetTargetY()
    
    local fMonX = pMonster:GetX()
    local fMonY = pMonster:GetY()
        
    fSpeedX = ( fTargetX - fMonX ) * 1.5
    if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
	end
    fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))

    pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
    pMonster:TurnToTarget()
    pMonster:SetSpeedX( fSpeedX * 0.01 )
    pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function GiantDrillmon_MoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
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

function GiantDrillmon_IdleMoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetIsContact() == true )then		
        if( pMonster:GetIsRight() == true ) then
            pMonster:SetIsRight( false )
            pMonster:SetSpeedX( -0.005 )        
        else
            pMonster:SetIsRight( true )
            pMonster:SetSpeedX( 0.005 )        
        end    
        
        pMonster:SetState( "IDLE" )		
	end
end
