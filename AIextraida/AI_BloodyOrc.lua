-- AI_BloodyOrc.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Throw_Orc_Wait.frm",
        Func    = "BloodyOrc_WaitFunc",


		-- �������ϵ��� ����ɼ� �ִ� Ʈ���ŵ��� �����Ѵ�.
		
        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 55,                            -- �󸶳� ���� ������ Ʈ���Ÿ� üũ�� �������� ��ġ�� �Է�(������)
                AIFunc              = "BloodyOrc_Check_Targeting",      -- Ʈ���Ű� üũ�Ǿ����� ����� ������ �Լ��� �̸��� �Է�(���������� �Է��ϴ� �Լ�)
                DelayFrame          = 100,                           -- ����� ����Ǿ����� Ʈ���� üũ�� �󸶵��� ���� �������� ��ġ�� �Է�
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "BloodyOrc_Check_ReleaseTarget",
                DelayFrame          = 550,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 80,
                AIFunc              = "BloodyOrc_Check_TurnToTarget",
                DelayFrame          = 80,
            },
            -- �ȱ�
            {
                AICheckFrame        = 85,
                AIFunc              = "BloodyOrc_Check_Walk",
                DelayFrame          = 120,
            },
            -- �޸���
            {
                AICheckFrame        = 85,
                AIFunc              = "BloodyOrc_Check_Run",
                DelayFrame          = 150,
            },
            -- �����̵�
            {
                AICheckFrame        = 80,
                AIFunc              = "BloodyOrc_Check_JumpMove",
                DelayFrame          = 220,
            },
            -- ������
            {
                AICheckFrame        = 95,
                AIFunc              = "BloodyOrc_Check_JumpUp",
                DelayFrame          = 100,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 110,
                AIFunc              = "BloodyOrc_Check_JumpDown",
                DelayFrame          = 60,
            },

            -- ��������
            {
                AICheckFrame        = 110,
                AIFunc              = "BloodyOrc_Check_Attack01",
                DelayFrame          = 150,
            },
            -- �����
            {
                AICheckFrame        = 170,
                AIFunc              = "BloodyOrc_Check_Attack02",
                DelayFrame          = 300,
            },
            -- ��ġ ������
            {
                AICheckFrame        = 120,
                AIFunc              = "BloodyOrc_Check_Attack03",
                DelayFrame          = 220,
            },
            -- ���� ����
            {
                AICheckFrame        = 80,
                AIFunc              = "BloodyOrc_Check_JumpAttack",
                DelayFrame          = 120,
            },
        },
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Throw_Orc_Walk.frm",
        Func            = "BloodyOrc_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "BloodyOrc_MoveFail",


        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "BloodyOrc_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "BloodyOrc_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 75,
                AIFunc              = "BloodyOrc_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- ������
            {
                AICheckFrame        = 75,
                AIFunc              = "BloodyOrc_Check_JumpUp",
                DelayFrame          = 75,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 130,
                AIFunc              = "BloodyOrc_Check_JumpDown",
                DelayFrame          = 130,
            },
            -- ���� ����
            {
                AICheckFrame        = 50,
                AIFunc              = "BloodyOrc_Check_JumpAttack",
                DelayFrame          = 120,
            },
			-- ���߱�
            {
                AICheckFrame        = 20,
                AIFunc              = "BloodyOrc_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- �޸���
    {
        ID              = "RUN",
        Motion          = "Bloody_Throw_Orc_Run.frm",
        Func            = "BloodyOrc_RunFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "BloodyOrc_MoveFail",


        Trigger =
        {
			-- ���߱�
            {
                AICheckFrame        = 1,
                AIFunc              = "BloodyOrc_Check_RunStop",
                DelayFrame          = 1,
            },
        }
    },

    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Bloody_Throw_Orc_Attack01.frm",
        Func    = "BloodyOrc_Attack01Func",
    },
    
    -- ��������02  ���ϱ�
    {
        ID      = "ATTACK02",
        Motion  = "Bloody_Throw_Orc_Attack02.frm",
        Func    = "BloodyOrc_Attack02Func",
    },
    
    -- ��ġ ������~
    {
        ID      = "ATTACK03",
        Motion  = "Throw_Orc_Attack02.frm",
        Func    = "BloodyOrc_Attack03Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Throw_Orc_Jump_up.frm",
        Func    = "BloodyOrc_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Throw_Orc_Jump_down.frm",
        Func    = "BloodyOrc_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Throw_Orc_Jump_Landing.frm",
        Func    = "BloodyOrc_ToWait",
    },

    -- ��������
    {
        ID      = "JUMPATTACK",
        Motion  = "Bloody_Throw_Orc_Attack04_A.frm",
        Func    = "BloodyOrc_Attack04Func",
    },
    
    -- ���ݰ��� ����
    {
        ID      = "ATTACK04_LANDING",
        Motion  = "Bloody_Throw_Orc_Attack04_B.frm",
        Func    = "BloodyOrc_Attack04LandFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Throw_Orc_Damage_Up.frm",
        Func    = "BloodyOrc_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Throw_Orc_Damage_Middle.frm",
        Func    = "BloodyOrc_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Throw_Orc_Damage_Down.frm",
        Func    = "BloodyOrc_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID                  = "DOWN_UP01",
        Motion              = "Warrior_Orc_Down_Up01.frm",
        Func                = "BloodyOrc_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "BloodyOrc_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID                  = "DOWN_UP02",
        Motion              = "Warrior_Orc_Down_Up02.frm",
        Func                = "BloodyOrc_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID                  = "DOWN_UP_LANDING",
        Motion              = "Warrior_Orc_Down_Up03.frm",
        Func                = "BloodyOrc_DownUp03Func",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BloodyOrc_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID                  = "DOWN_MIDDLE",
        Motion              = "Warrior_Orc_Down_Up03.frm",
        Func                = "BloodyOrc_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BloodyOrc_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- �ٿ� ��
    {
        ID                  = "DOWN_DOWN",
        Motion              = "Warrior_Orc_Down_Up03.frm",
        Func                = "BloodyOrc_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BloodyOrc_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID                  = "DOWN_SPECIAL",
        Motion              = "Warrior_Orc_Down_Special01.frm",
        Func                = "BloodyOrc_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Warrior_Orc_Down_Special02.frm",
        Func    = "BloodyOrc_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BloodyOrc_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID                  = "DIE",
        Motion              = "Throw_Orc_Die.frm",
        Func                = "BloodyOrc_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID                  = "DIE_LANDING",
        Motion              = "Throw_Orc_Die.frm",
        Func                = "BloodyOrc_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },

    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Throw_Orc_Standup.frm",
        Func    = "BloodyOrc_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Throw_Orc_Stone.frm",
        Func    = "BloodyOrc_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Throw_Orc_Stone.frm",
        Func    = "BloodyOrc_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Throw_Orc_Stone.frm",
		Func	= "BloodyOrc_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnBloodyOrc_Land",
    Die     = "OnBloodyOrc_Die",
    Damage  = "OnBloodyOrc_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitBloodyOrc( iMonsterIndex )
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
function BloodyOrc_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		pMonster:SetSpeedX( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function BloodyOrc_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �޸��� ����
function BloodyOrc_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- �״»��� ����
function BloodyOrc_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 1 ) then
		pMonster:SetInvincible( true )
		--pMonster:SetIsRight( not pMonster:GetIsRight())
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function BloodyOrc_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function BloodyOrc_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function BloodyOrc_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function BloodyOrc_DownUp03Func( iMonsterIndex, iFrame )
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
function BloodyOrc_DownFunc( iMonsterIndex, iFrame )
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
function BloodyOrc_DownDownFunc( iMonsterIndex, iFrame )
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
function BloodyOrc_DownSpecialFunc( iMonsterIndex, iFrame )
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

-- �ٿ� ����� ����
function BloodyOrc_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function BloodyOrc_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  �������� ����
function BloodyOrc_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame == 56 ) then
		pMonster:AddDamage( DT_BLOODYORC_ATK1_1 )
		pMonster:PlaySound( 998017 )
    elseif( iFrame == 89 ) then
		pMonster:AddDamage( DT_BLOODYORC_ATK1_2 )
		pMonster:PlaySound( 998017 )
    elseif( iFrame == 119 ) then
		pMonster:AddDamage( DT_BLOODYORC_ATK1_3 )
		pMonster:PlaySound( 998017 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ơơ ����
function BloodyOrc_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 63 ) then
		pMonster:PlaySound( 998018 )
	elseif( iFrame == 66 ) then
		pMonster:AddDamage( DT_BLOODYORC_UWEK_1 )
	elseif( iFrame == 108 ) then
		pMonster:PlaySound( 998018 )
	elseif( iFrame == 111 ) then
		pMonster:AddDamage( DT_BLOODYORC_UWEK_1 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����ġ ������
function BloodyOrc_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1) then
        pMonster:TurnToTarget()
    elseif( iFrame == 69 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.0 ) -- Ÿ�������� ������ ���
		pMonster:AddDamageWithAngle( DT_BLOODYORC_THROW_WEAPON, pMonster:GetAngleToTarget() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function BloodyOrc_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 27 ) then
		pMonster:PlaySound( 998017 )
		BloodyOrc_Jump( iMonsterIndex )
	elseif( iFrame == 30 ) then
		pMonster:AddDamage(DT_BLOODYORC_JUMPATK)
	elseif( iFrame == 38 ) then
		pMonster:PlaySound( 998017 )
	elseif( iFrame == 41 ) then
		pMonster:AddDamage(DT_BLOODYORC_JUMPATK)
	elseif( iFrame == 59 ) then
		pMonster:PlaySound( 998017 )
	elseif( iFrame == 62 ) then
		pMonster:AddDamage(DT_BLOODYORC_JUMPATK)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function BloodyOrc_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	 if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� �ٿ� ����
function BloodyOrc_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function BloodyOrc_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function BloodyOrc_Attack04LandFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function BloodyOrc_StoneCurseFunc( iMonsterIndex, iFrame )
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
function BloodyOrc_IceCurseFunc( iMonsterIndex, iFrame )
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
function BloodyOrc_HoldFunc( iMonsterIndex, iFrame )
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

function BloodyOrc_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--pMonster:CheckTargetInRange( 100, -350, 200, 350, -100 )
	--pMonster:CheckTargetInRange( 0, -200, 350, 200, -200 )
    if( pMonster:SetTarget( 100, -2050, 2000, 350, -100 ) == true or pMonster:SetTarget( 0, -200, 350, 200, -200 ) == true ) then
		pMonster:TurnToTarget()
		
		pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
end

function BloodyOrc_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function BloodyOrc_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
        pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function BloodyOrc_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true and pMonster:CheckTargetInRange( 0, -100, 100, 100, -150 ) == false and pMonster:FloatRand() < 0.7 ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function BloodyOrc_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 400, -300, 200, 300, -250 ) == true and pMonster:CheckTargetInRange( 0, -100, 100, 100, -150 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "RUN" )
		pMonster:ResetDelay()
	end	
end

function BloodyOrc_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 240, 160, -320 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function BloodyOrc_Check_RunStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -160, 140, 160, -200 ) == true or pMonster:CheckTargetInRange( 400, -300, 200, 300, -250 ) == false ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function BloodyOrc_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function BloodyOrc_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 70, -80, 90, 80, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function BloodyOrc_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -80, 50, 220, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function BloodyOrc_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 220, -300, 250, 300, -250 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function BloodyOrc_Check_JumpMove( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 350, -50, 100, 50, -100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetNoCheckContact(50)
		pMonster:SetState( "JUMP" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.5 )
		pMonster:SetSpeedY( 0.04 )			
		pMonster:ResetDelay()
	end
end

function BloodyOrc_Check_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -110, 400, 110, 150 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetState( "JUMPATTACK" )
		pMonster:ResetDelay()
	end
end

function BloodyOrc_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -150, 300, 150, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		BloodyOrc_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function BloodyOrc_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -300 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )			
		pMonster:ResetDelay()
	end
end

function BloodyOrc_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnBloodyOrc_Land( iMonsterIndex )
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
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "JUMPATTACK" ) == true ) then
		pMonster:SetState( "ATTACK04_LANDING" )
    end

	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE" )
	end
end

function OnBloodyOrc_Die( iMonsterIndex )
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

function OnBloodyOrc_Damage( iMonsterIndex )
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
end

function BloodyOrc_Jump( iMonsterIndex )
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

function BloodyOrc_MoveFail( iMonsterIndex )
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

