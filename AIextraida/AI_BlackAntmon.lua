-- AI_BlackAntmon.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Antmon_Wait.frm",
        Func    = "BlackAntmon_WaitFunc",


		-- �������ϵ��� ����ɼ� �ִ� Ʈ���ŵ��� �����Ѵ�.
		
        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 55,                            -- �󸶳� ���� ������ Ʈ���Ÿ� üũ�� �������� ��ġ�� �Է�(������)
                AIFunc              = "BlackAntmon_Check_Targeting",      -- Ʈ���Ű� üũ�Ǿ����� ����� ������ �Լ��� �̸��� �Է�(���������� �Է��ϴ� �Լ�)
                DelayFrame          = 110,                           -- ����� ����Ǿ����� Ʈ���� üũ�� �󸶵��� ���� �������� ��ġ�� �Է�
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "BlackAntmon_Check_ReleaseTarget",
                DelayFrame          = 660,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackAntmon_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- �ȱ�
            {
                AICheckFrame        = 75,
                AIFunc              = "BlackAntmon_Check_Walk",
                DelayFrame          = 75,
            },
            -- �����̵�
            {
                AICheckFrame        = 75,
                AIFunc              = "BlackAntmon_Check_JumpMove",
                DelayFrame          = 165,
            },        
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackAntmon_Check_JumpAttack",
                DelayFrame          = 55,
            },
            -- ������
            {
                AICheckFrame        = 75,
                AIFunc              = "BlackAntmon_Check_JumpUp",
                DelayFrame          = 75,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 110,
                AIFunc              = "BlackAntmon_Check_JumpDown",
                DelayFrame          = 165,
            },
            -- �ʻ��
            {
                AICheckFrame        = 45,
                AIFunc              = "BlackAntmon_Check_SpecialAttack",
                DelayFrame          = 550,
            },
            -- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "BlackAntmon_Check_Attack01",
                DelayFrame          = 55,
            },
            -- ������(�̵�)
            {
                AICheckFrame        = 110,
                AIFunc              = "BlackAntmon_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },
    
    {
        ID      = "SUMMON",
        Motion  = "Antmon_Wait.frm",
        Func    = "BlackAntmon_SummonFunc",
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Antmon_Walk.frm",
        Func            = "BlackAntmon_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "BlackAntmon_MoveFail",


        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackAntmon_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "BlackAntmon_Check_ReleaseTarget",
                DelayFrame          = 550,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackAntmon_Check_TurnToTarget",
                DelayFrame          = 55,
            },
			-- �޸���
            {
                AICheckFrame        = 75,
                AIFunc              = "BlackAntmon_Check_Run",
                DelayFrame          = 110,
            },
            -- ������
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackAntmon_Check_JumpUp",
                DelayFrame          = 55,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 110,
                AIFunc              = "BlackAntmon_Check_JumpDown",
                DelayFrame          = 165,
            },
            -- ��������
            {
                AICheckFrame        = 15,
                AIFunc              = "BlackAntmon_Check_Attack01",
                DelayFrame          = 55,
            },
			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "BlackAntmon_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- ������
    {
        ID              = "IDLE",
        Motion          = "Antmon_Walk.frm",
        Func            = "BlackAntmon_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "BlackAntmon_IdleMoveFail",


        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 45,
                AIFunc              = "BlackAntmon_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ������(����)
            {
                AICheckFrame        = 440,
                AIFunc              = "BlackAntmon_Check_Idle_Stop",
                DelayFrame          = 440,
            },
        }
    },
    
    -- �޸���
    {
        ID              = "RUN",
        Motion          = "Antmon_Run.frm",
        Func            = "BlackAntmon_RunFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "BlackAntmon_MoveFail",


        Trigger =
        {
			-- ���߱�
            {
                AICheckFrame        = 1,
                AIFunc              = "BlackAntmon_Check_RunStop",
                DelayFrame          = 1,
            },
        }
    },

    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Antmon_Attack01.frm",
        Func    = "BlackAntmon_Attack01Func",
    },

    -- �ʻ��
    {
        ID      = "SPECIAL_ATTACK",
        Motion  = "Antmon_SpecialAttack.frm",
        Func    = "BlackAntmon_SpecialAttackFunc",
    },

    -- ����
    {
        ID      = "JUMP",
        Motion  = "antmon_jump_up.frm",
        Func    = "BlackAntmon_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "antmon_Jump_Down.frm",
        Func    = "Antmon_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "antmon_Jump_Landing.frm",
        Func    = "Antmon_ToWait",
    },

    -- ��������
    {
        ID      = "JUMPATTACK",
        Motion  = "Antmon_JumpAttack.frm",
        Func    = "BlackAntmon_JumpAttackFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Antmon_Damage_Up.frm",
        Func    = "BlackAntmon_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Antmon_Damage_Middle.frm",
        Func    = "BlackAntmon_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Antmon_Damage_Down.frm",
        Func    = "BlackAntmon_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "Antmon_Down_Up01.frm",
        Func    = "BlackAntmon_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "BlackAntmon_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID                  = "DOWN_UP02",
        Motion              = "Antmon_Down_Up02.frm",
        Func                = "BlackAntmon_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID                  = "DOWN_UP_LANDING",
        Motion              = "Antmon_Down_Up03.frm",
        Func                = "BlackAntmon_DownUp03Func",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackAntmon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID                  = "DOWN_MIDDLE",
        Motion              = "Antmon_Down_Middle.frm",
        Func                = "BlackAntmon_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackAntmon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- �ٿ� ��
    {
        ID                  = "DOWN_DOWN",
        Motion              = "Antmon_Down_Down.frm",
        Func                = "BlackAntmon_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackAntmon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID                  = "DOWN_SPECIAL",
        Motion              = "Antmon_Down_Special01.frm",
        Func                = "BlackAntmon_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID                  = "DOWN_SPECIAL_LANDING",
        Motion              = "Antmon_Down_Special02.frm",
        Func                = "BlackAntmon_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackAntmon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID                  = "DIE",
        Motion              = "Antmon_Die01.frm",
        Func                = "BlackAntmon_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID                  = "DIE_LANDING",
        Motion              = "Antmon_Die02.frm",
        Func                = "BlackAntmon_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },

    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Antmon_Standup.frm",
        Func    = "BlackAntmon_StandupFunc",
    },
    
    -- ������
    {
        ID      = "STANDUP_ATTACK",
        Motion  = "Antmon_StandupAttack.frm",
        Func    = "BlackAntmon_StandupAttackFunc",
    },
    
    -- ȸ��
    {
        ID      = "AVOID",
        Motion  = "Antmon_Avoid.frm",
        Func    = "BlackAntmon_AvoidFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Antmon_Stone.frm",
        Func    = "BlackAntmon_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Antmon_Stone.frm",
        Func    = "BlackAntmon_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Antmon_Stone.frm",
		Func	= "BlackAntmon_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnBlackAntmon_Land",
    Die     = "OnBlackAntmon_Die",
    Damage  = "OnBlackAntmon_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitBlackAntmon( iMonsterIndex )
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
function BlackAntmon_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ��� ����
function BlackAntmon_SummonFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 3 ) then
		local posy = 0.1
		pMonster:AddParticle("Arme01_Death_Shot_03", 0.0, posy)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function BlackAntmon_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function BlackAntmon_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- �޸��� ����
function BlackAntmon_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- �״»���
function BlackAntmon_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LANDING" )
    end
end

-- �״»��� ����
function BlackAntmon_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function BlackAntmon_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function BlackAntmon_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function BlackAntmon_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function BlackAntmon_DownUp03Func( iMonsterIndex, iFrame )
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
function BlackAntmon_DownFunc( iMonsterIndex, iFrame )
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
function BlackAntmon_DownDownFunc( iMonsterIndex, iFrame )
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
function BlackAntmon_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function BlackAntmon_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function BlackAntmon_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ������
function BlackAntmon_StandupAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 56 ) then
	pMonster:PlaySound(533)
        pMonster:SetNoCheckContact( 40 )
        if( pMonster:GetIsRight() ) then
            pMonster:SetSpeedX( 0.007 )
        else
            pMonster:SetSpeedX( -0.007 )
        end
        pMonster:SetSpeedY( 0.034 )
    elseif( iFrame == 86 ) then
        pMonster:AddDamage( DT_MONSTER_ANTMON01 )
    elseif( iFrame == 93 ) then
        pMonster:AddDamage( DT_MONSTER_ANTMON01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function BlackAntmon_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 44 ) then
		pMonster:PlaySound(533)
        pMonster:AddDamage( DT_MONSTER_ANTMON01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �ʻ�� ����
function BlackAntmon_SpecialAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 61 ) then
		pMonster:AddParticle("special02_1_2", 0.04, 0.18)
		pMonster:AddParticle("special02_1_3", 0.04, 0.18)
	elseif( iFrame == 91 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( -0.007 )
		else
			pMonster:SetSpeedX( 0.007 )
		end
		pMonster:PlaySound(530)
		pMonster:AddDamage( DT_MONSTER_ANTMON02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function BlackAntmon_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� �ٿ� ����
function Antmon_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function Antmon_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function BlackAntmon_JumpAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 41 ) then
	pMonster:PlaySound(533)
        pMonster:AddDamage( DT_MONSTER_ANTMON01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ȸ�� ����
function BlackAntmon_AvoidFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 15 )
    elseif( iFrame == 6 ) then
        if( pMonster:GetIsRight() ) then
            pMonster:SetSpeedX( -0.015 )
        else
            pMonster:SetSpeedX( 0.015 )
        end
        pMonster:SetNoCheckContact( 5 )
        pMonster:SetSpeedY( 0.02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function BlackAntmon_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function BlackAntmon_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function BlackAntmon_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Small", 0.0, 0.12 )
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

function BlackAntmon_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -300, 400, 300, -200 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function BlackAntmon_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function BlackAntmon_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
        pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function BlackAntmon_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true and pMonster:CheckTargetInRange( 0, -100, 100, 100, -150 ) == false and pMonster:FloatRand() < 0.7 ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function BlackAntmon_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 400, -300, 200, 300, -250 ) == true and pMonster:CheckTargetInRange( 0, -100, 100, 100, -150 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "RUN" )
		pMonster:ResetDelay()
	end	
end

function BlackAntmon_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 240, 160, -320 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function BlackAntmon_Check_RunStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -160, 140, 160, -200 ) == true or pMonster:CheckTargetInRange( 400, -300, 200, 300, -250 ) == false ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function BlackAntmon_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function BlackAntmon_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 70, -80, 100, 80, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function BlackAntmon_Check_SpecialAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -100, 100, 100, -100 ) == true and pMonster:FloatRand() < 0.8 and pMonster:GetCountValue() >= 3 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "SPECIAL_ATTACK" )
		pMonster:ResetDelay()
	end
end

function BlackAntmon_Check_JumpMove( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 350, -50, 100, 50, -100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetNoCheckContact(50)
		pMonster:SetState( "JUMP" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.5 )
		pMonster:SetSpeedY( 0.04 )			
		pMonster:ResetDelay()
	end
end

function BlackAntmon_Check_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -150, 350, 150, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:AddCountValue(1)
		BlackAntmon_Jump( iMonsterIndex )
		pMonster:SetState( "JUMPATTACK" )
		pMonster:ResetDelay()
	end
end

function BlackAntmon_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -150, 350, 150, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		BlackAntmon_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function BlackAntmon_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )			
		pMonster:ResetDelay()
	end
end

function BlackAntmon_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:CheckTargetInRange( 200, -200, 200, 200, -100 ) == true ) then
			if ( pMonster:FloatRand() < 0.4) then				
				pMonster:AddCountValue(-3)
				pMonster:SetState( "STANDUP_ATTACK" )				
			else
				pMonster:SetState( "STANDUP" )
			end			
		else
			pMonster:SetState( "STANDUP" )
		end
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function BlackAntmon_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function BlackAntmon_Check_Idle_Stop( iMonsterIndex, iFrame )
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
function OnBlackAntmon_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (1.0 / 2.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
        pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_SPECIAL_LANDING" )
    end
end

function OnBlackAntmon_Die( iMonsterIndex )
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

function OnBlackAntmon_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:AddCountValue(1)	
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPATTACK" ) == true ) then
        if( pMonster:IsSuperArmor() == false ) then
            pMonster:SetNoCheckContact( 5 )
        end
	end
    
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
		
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		pMonster:SetNoCheckContact( 25 )
		if( pMonster:CheckState( "DAMAGE_UP" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 3 )
			pMonster:SetSpeedY( 0.024 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.032 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )
		elseif( pMonster:CheckState( "DAMAGE_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )			
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			if( pMonster:GetIsRight() == true) then
				pMonster:SetSpeedX( -0.025 )			
			else
				pMonster:SetSpeedX( 0.025 )			
			end
			pMonster:SetNoCheckContact( 5 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_MIDDLE" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )			
		end	
	end
	
    if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if ( pMonster:FloatRand() < 0.1 and pMonster:GetIsContact() == true and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
			if ( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "AVOID" )
			else
				pMonster:SetState( "SPECIAL_ATTACK" )
			end
		end
    end
end

function BlackAntmon_Jump( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    local fTargetX = pMonster:GetTargetX()
    local fTargetY = pMonster:GetTargetY()
    
    local fMonX = pMonster:GetX()
    local fMonY = pMonster:GetY()
        
    fSpeedX = ( fTargetX - fMonX ) * 1.5
    fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.8) + pMonster:FloatAbs((fSpeedX / 3.1)))

    pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
    pMonster:TurnToTarget()
    pMonster:SetSpeedX( fSpeedX * 0.01 )
    pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function BlackAntmon_MoveFail( iMonsterIndex )
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

function BlackAntmon_IdleMoveFail( iMonsterIndex )
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
