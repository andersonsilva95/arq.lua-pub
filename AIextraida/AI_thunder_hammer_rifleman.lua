-- AI_thunder_hammer_rifleman.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "thunder_hammer_rifleman_Wait.frm",
        Func    = "thunder_hammer_rifleman_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 30,
                AIFunc              = "thunder_hammer_rifleman_Check_Targeting",
                DelayFrame          = 100,
            },

            -- Ÿ������
            {
                AICheckFrame        = 150,
                AIFunc              = "thunder_hammer_rifleman_Check_ReleaseTarget",
                DelayFrame          = 100,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 30,
                AIFunc              = "thunder_hammer_rifleman_Check_TurnToTarget",
                DelayFrame          = 10,
            },

            -- �ȱ�
            {
                AICheckFrame        = 100,
                AIFunc              = "thunder_hammer_rifleman_Check_Walk",
                DelayFrame          = 150,
            },

            -- ������
            {
                AICheckFrame        = 91,
                AIFunc              = "thunder_hammer_rifleman_Check_JumpUp",
                DelayFrame          = 150,
            },

            -- �����ٿ�
            {
                AICheckFrame        = 92,
                AIFunc              = "thunder_hammer_rifleman_Check_JumpDown",
                DelayFrame          = 100,
            },

            -- ������(�̵�)
            --{
            --    AICheckFrame        = 330,
            --    AIFunc              = "thunder_hammer_rifleman_Check_Idle",
            --    DelayFrame          = 220,
            --},

			-- ������ �� ��
            {
                AICheckFrame        = 5,
                AIFunc              = "thunder_hammer_rifleman_Check_Attack01",
                DelayFrame          = 150,
            },

            -- ������ �� ��
            {
                AICheckFrame        = 5,
                AIFunc              = "thunder_hammer_rifleman_Check_Attack02",
                DelayFrame          = 150,
            },

            -- ������ �� ��
            {
                AICheckFrame        = 5,
                AIFunc              = "thunder_hammer_rifleman_Check_Attack03",
                DelayFrame          = 150,
            },

            -- ī���� ��
            {
                AICheckFrame        = 110,
                AIFunc              = "thunder_hammer_rifleman_Check_Attack04",
                DelayFrame          = 660,
				DelayFrame1         = 550,
				DelayFrame2         = 330,
				DelayFrame3         = 330,
            },

		},
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "thunder_hammer_rifleman_walk.frm",
        Func            = "thunder_hammer_rifleman_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "thunder_hammer_rifleman_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 20,
                AIFunc              = "thunder_hammer_rifleman_Check_Targeting",
                DelayFrame          = 100,
            },
            -- Ÿ������
            {
                AICheckFrame        = 150,
                AIFunc              = "thunder_hammer_rifleman_Check_ReleaseTarget",
                DelayFrame          = 100,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 20,
                AIFunc              = "thunder_hammer_rifleman_Check_TurnToTarget",
                DelayFrame          = 10,
            },
            -- ������
            {
                AICheckFrame        = 81,
                AIFunc              = "thunder_hammer_rifleman_Check_JumpUp",
                DelayFrame          = 100,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 82,
                AIFunc              = "thunder_hammer_rifleman_Check_JumpDown",
                DelayFrame          = 100,
            },
			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "thunder_hammer_rifleman_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
    
     -- ������
    {
        ID              = "IDLE",
        Motion          = "thunder_hammer_rifleman_walk.frm",
        Func            = "thunder_hammer_rifleman_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "thunder_hammer_rifleman_IdleMoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 40,
                AIFunc              = "thunder_hammer_rifleman_Check_Targeting",
                DelayFrame          = 80,
            },
            -- ������(����)
            {
                AICheckFrame        = 220,
                AIFunc              = "thunder_hammer_rifleman_Check_Idle_Stop",
                DelayFrame          = 110,
            },
        }
    },
    
    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "thunder_hammer_rifleman_Attack01.frm",
        Func    = "thunder_hammer_rifleman_Attack01Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK02",
        Motion  = "thunder_hammer_rifleman_Attack02.frm",
        Func    = "thunder_hammer_rifleman_Attack02Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK03",
        Motion  = "thunder_hammer_rifleman_Attack03.frm",
        Func    = "thunder_hammer_rifleman_Attack03Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK04",
        Motion  = "thunder_hammer_rifleman_Attack04.frm",
        Func    = "thunder_hammer_rifleman_Attack04Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "thunder_hammer_rifleman_Jump_Up.frm",
        Func    = "thunder_hammer_rifleman_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "thunder_hammer_rifleman_Jump_Down.frm",
        Func    = "thunder_hammer_rifleman_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "thunder_hammer_rifleman_Jump_Landing.frm",
        Func    = "thunder_hammer_rifleman_ToWait",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "thunder_hammer_rifleman_Damage_Up.frm",
        Func    = "thunder_hammer_rifleman_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "thunder_hammer_rifleman_Damage_Middle.frm",
        Func    = "thunder_hammer_rifleman_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "thunder_hammer_rifleman_Damage_Down.frm",
        Func    = "thunder_hammer_rifleman_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "thunder_hammer_rifleman_Down_Up01.frm",
        Func    = "thunder_hammer_rifleman_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "thunder_hammer_rifleman_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "thunder_hammer_rifleman_Down_Up02.frm",
        Func    = "thunder_hammer_rifleman_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "thunder_hammer_rifleman_Down_Up03.frm",
        Func    = "thunder_hammer_rifleman_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "thunder_hammer_rifleman_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "thunder_hammer_rifleman_Down_Middle.frm",
        Func    = "thunder_hammer_rifleman_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "thunder_hammer_rifleman_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "thunder_hammer_rifleman_Down_Middle.frm",
        Func    = "thunder_hammer_rifleman_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "thunder_hammer_rifleman_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "thunder_hammer_rifleman_Down_Special01.frm",
        Func    = "thunder_hammer_rifleman_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "thunder_hammer_rifleman_Down_Special02.frm",
        Func    = "thunder_hammer_rifleman_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "thunder_hammer_rifleman_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ� ����
    {
        ID      = "DIE",
        Motion  = "thunder_hammer_rifleman_down_middle.frm",
        Func    = "thunder_hammer_rifleman_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },

    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "thunder_hammer_rifleman_die.frm",
        Func    = "thunder_hammer_rifleman_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "thunder_hammer_rifleman_Standup.frm",
        Func    = "thunder_hammer_rifleman_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Stone_clan_goblin_fighter_stone.frm",
        Func    = "thunder_hammer_rifleman_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Stone_clan_goblin_fighter_stone.frm",
        Func    = "thunder_hammer_rifleman_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Stone_clan_goblin_fighter_stone.frm",
		Func	= "thunder_hammer_rifleman_HoldFunc",
	},
}

CallBack =
{
    Land    = "Onthunder_hammer_rifleman_Land",
    Die     = "Onthunder_hammer_rifleman_Die",
    Damage  = "Onthunder_hammer_rifleman_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function Initthunder_hammer_rifleman( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function thunder_hammer_rifleman_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function thunder_hammer_rifleman_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function thunder_hammer_rifleman_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- �׾���
function thunder_hammer_rifleman_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- �ױ� ����
function thunder_hammer_rifleman_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetSpeedX(0)

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(987016)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function thunder_hammer_rifleman_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function thunder_hammer_rifleman_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function thunder_hammer_rifleman_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function thunder_hammer_rifleman_DownUp03Func( iMonsterIndex, iFrame )
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
function thunder_hammer_rifleman_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
    end
    
    if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end

-- �ٿ� �����
function thunder_hammer_rifleman_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function thunder_hammer_rifleman_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function thunder_hammer_rifleman_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function thunder_hammer_rifleman_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 48 ) then
        angle = 0.522
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		else
			angle = angle
        end
        pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_RIFLEMAN_BULLET, 0.15, 0.38, false, angle )
    elseif( iFrame == 51 ) then
		pMonster:AddParticle("Ghost_Shooter_Shot_01", 0.22, 0.43)
		pMonster:AddParticle("Ghost_Shooter_Shot_02", 0.22, 0.43)
		
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge", 0.2, 0.4, true)
		else
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge_R", 0.05, 0.3, true)
		end
		pMonster:PlaySound(987017)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��������2 ����
function thunder_hammer_rifleman_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 48 ) then
		 angle = 0.0
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		else
			angle = angle
        end
        pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_RIFLEMAN_BULLET, 0.18, 0.26, false, angle )
    elseif( iFrame == 51 ) then
		pMonster:AddParticle("Ghost_Shooter_Shot_01", 0.22, 0.25)
		pMonster:AddParticle("Ghost_Shooter_Shot_02", 0.22, 0.25)
		
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge", 0.25, 0.25, true)
		else
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge_R", 0.0, 0.25, true)
		end
		pMonster:PlaySound(987017)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��������2 ����
function thunder_hammer_rifleman_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 48 ) then
		 angle = -0.60
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		else
			angle = angle
        end
        pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_RIFLEMAN_BULLET, 0.18, 0.18, false, angle )
    elseif( iFrame == 51 ) then
		pMonster:AddParticle("Ghost_Shooter_Shot_01", 0.22, 0.2)
		pMonster:AddParticle("Ghost_Shooter_Shot_02", 0.22, 0.2)
		
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge", 0.2, 0.2, true)
		else
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge_R", -0.05, 0.2, true)
		end
		pMonster:PlaySound(987017)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��������2 ����
function thunder_hammer_rifleman_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 50 ) then
		pMonster:SkillReadyEffectNoStop( 0, 128, 0, 0.5 )
	elseif( iFrame == 60 ) then
		angle = -0.786
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		else
			angle = angle
        end
        pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_RIFLEMAN_COUNTERSHOT, 0.0, 0.3, false, angle )
		pMonster:PlaySound(987018)
    elseif( iFrame == 63 ) then
		pMonster:AddParticle("Ghost_Shooter_Shot_01", 0.2, 0.6)
		pMonster:AddParticle("Ghost_Shooter_Shot_02", 0.2, 0.6)
		pMonster:AddParticle("Furious_Storm_Stormcut_Hit_02", 0.2, 0.6)
		pMonster:AddParticle("Furious_Storm_Stormcut_Hit_03", 0.2, 0.6)
		
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge", 0.2, 0.6, true)
		else
			pMonster:AddParticleNoDirection("Ghost_Shooter_Cartridge_R", -0.05, 0.6, true)
		end
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  ���� ����
function thunder_hammer_rifleman_JumpFunc( iMonsterIndex, iFrame )
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
function thunder_hammer_rifleman_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function thunder_hammer_rifleman_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function thunder_hammer_rifleman_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetInvincible( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function thunder_hammer_rifleman_IceCurseFunc( iMonsterIndex, iFrame )
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
function thunder_hammer_rifleman_HoldFunc( iMonsterIndex, iFrame )
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

function thunder_hammer_rifleman_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 60, -330, 300, 330, -300 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function thunder_hammer_rifleman_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -500, 350, 500, -350 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function thunder_hammer_rifleman_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function thunder_hammer_rifleman_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -300, 460, 300, -400 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function thunder_hammer_rifleman_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -300, 460, 300, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function thunder_hammer_rifleman_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function thunder_hammer_rifleman_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -110, 320, 110, 120 ) == true) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function thunder_hammer_rifleman_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 444, -300, 60, 300, -70 ) == true) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function thunder_hammer_rifleman_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -110, -140, 110, -260 ) == true or pMonster:CheckTargetInRange( 510, -110, -260, 110, -400 ) == true) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function thunder_hammer_rifleman_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -100, 50, 100, -100 ) == true) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function thunder_hammer_rifleman_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -100, 360, 100, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		thunder_hammer_rifleman_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function thunder_hammer_rifleman_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -150, -100, 150, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function thunder_hammer_rifleman_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function thunder_hammer_rifleman_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function thunder_hammer_rifleman_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function Onthunder_hammer_rifleman_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
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

function Onthunder_hammer_rifleman_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetState( "DIE" )
	end	
end

function Onthunder_hammer_rifleman_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
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

	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if ( pMonster:FloatRand() < 0.04 and pMonster:GetIsContact() == true ) then

			if( pMonster:CheckTargetInRange( 0, -200, 50, 200, -100 ) == true ) then
				pMonster:TurnToTarget()
				pMonster:SetState( "ATTACK04" )
			elseif ( pMonster:CheckTargetInRange( 0, -999, 60, 999, -70 ) == true ) then
				pMonster:TurnToTarget()
				pMonster:SetState( "ATTACK02" )
			end
		end
	end
end

function thunder_hammer_rifleman_Jump( iMonsterIndex )
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
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function thunder_hammer_rifleman_MoveFail( iMonsterIndex )
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

function thunder_hammer_rifleman_IdleMoveFail( iMonsterIndex )
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
