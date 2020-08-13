-- AI_NeoCrab.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "neo_lobster_wait.frm",
        Func    = "NeoCrab_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 255,
                AIFunc              = "NeoCrab_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "NeoCrab_Check_ReleaseTarget",
                DelayFrame          = 550,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "NeoCrab_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- �ȱ�
            {
                AICheckFrame        = 75,
                AIFunc              = "NeoCrab_Check_Walk",
                DelayFrame          = 110,
            },   
			-- �޸���
            {
                AICheckFrame        = 75,
                AIFunc              = "NeoCrab_Check_Run",
                DelayFrame          = 220,
            },			
            -- �����̵�
            {
                AICheckFrame        = 75,
                AIFunc              = "NeoCrab_Check_JumpMove",
                DelayFrame          = 165,
            },     
            -- ��������
            {
                AICheckFrame        = 95,
                AIFunc              = "NeoCrab_Check_Attack01",
                DelayFrame          = 55,
            },
             -- �ʻ��
            {
                AICheckFrame        = 125,
                AIFunc              = "NeoCrab_Check_Attack02",
                DelayFrame          = 165,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "NeoCrab_Check_HighJump",
                DelayFrame          = 75,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 165,
                AIFunc              = "NeoCrab_Check_JumpDown",
                DelayFrame          = 165,
            },            
            -- ������(�̵�)
            {
                AICheckFrame        = 110,
                AIFunc              = "NeoCrab_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "neo_lobster_move.frm",
        Func    = "NeoCrab_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "NeoCrab_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 55,
                AIFunc              = "NeoCrab_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "NeoCrab_Check_ReleaseTarget",
                DelayFrame          = 44,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "NeoCrab_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- �޸���
            {
                AICheckFrame        = 75,
                AIFunc              = "NeoCrab_Check_Run",
                DelayFrame          = 165,
            },
             -- ����
            {
                AICheckFrame        = 25,
                AIFunc              = "NeoCrab_Check_Attack01",
                DelayFrame          = 110,
            },
             -- �ʻ��
            {
                AICheckFrame        = 65,
                AIFunc              = "NeoCrab_Check_Attack02",
                DelayFrame          = 220,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "NeoCrab_Check_HighJump",
                DelayFrame          = 110,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 110,
                AIFunc              = "NeoCrab_Check_JumpDown",
                DelayFrame          = 220,
            },
			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "NeoCrab_Check_WalkStop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- ������
    {
        ID              = "IDLE",
        Motion          = "neo_lobster_move.frm",
        Func            = "NeoCrab_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "NeoCrab_IdleMoveFail",


        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 45,
                AIFunc              = "NeoCrab_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ������(����)
            {
                AICheckFrame        = 440,
                AIFunc              = "NeoCrab_Check_Idle_Stop",
                DelayFrame          = 440,
            },
        }
    },
    
    -- �޸���
    {
        ID      = "RUN",
        Motion  = "ArmorCrab_Run.frm",
        Func    = "NeoCrab_RunFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "NeoCrab_MoveFail",


        Trigger =
        {
			-- ���߱�
            {
                AICheckFrame        = 1,
                AIFunc              = "NeoCrab_Check_RunStop",
                DelayFrame          = 1,
            },
        }
    },

    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "neo_lobster_three_combo_attack_01.frm",
        Func    = "NeoCrab_Attack01Func",
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "NeoCrab_Check_NextCombo2",
                DelayFrame          = 1,
            },
        }
    },
    
    -- �������� 2 Ÿ
    {
        ID      = "ATTACK02",
        Motion  = "neo_lobster_three_combo_attack_02.frm",
        Func    = "NeoCrab_Attack02Func",
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "NeoCrab_Check_NextCombo3",
                DelayFrame          = 1,
            },
        }
    },
    
    -- �������� 3 Ÿ
    {
        ID      = "ATTACK03",
        Motion  = "neo_lobster_three_combo_attack_03.frm",
        Func    = "NeoCrab_Attack03Func",
    },
    
    -- ���̾
    {
        ID      = "ATTACK201",
        Motion  = "neo_lobster_fireball.frm",
        Func    = "NeoCrab_Attack201Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "neo_lobster_jump.frm",
        Func    = "NeoCrab_JumpFunc",
    },

    -- ��������
    {
        ID      = "HIGHJUMP",
        Motion  = "neo_lobster_jump.frm",
        Func    = "NeoCrab_HighJumpFunc",
    },
    
    
    -- ���� �� ���� 
    {
        ID      = "JUMPLANDING",
        Motion  = "neo_lobster_jump_landing.frm",
        Func    = "NeoCrab_JumpLandingFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "neo_lobster_damage_up.frm",
        Func    = "NeoCrab_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "neo_lobster_damage_middle.frm",
        Func    = "NeoCrab_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "neo_lobster_damage_down.frm",
        Func    = "NeoCrab_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "neo_lobster_down_up_01.frm",
        Func    = "NeoCrab_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "NeoCrab_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "neo_lobster_down_up_02.frm",
        Func    = "NeoCrab_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "neo_lobster_down_up_03.frm",
        Func    = "NeoCrab_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "NeoCrab_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "neo_lobster_down_middle.frm",
        Func    = "NeoCrab_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "NeoCrab_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "ArmorCrab_Down_Down.frm",
        Func    = "NeoCrab_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "NeoCrab_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "NEO_lobster_Down_Special_01.frm",
        Func    = "NeoCrab_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "NEO_lobster_Down_Special_02.frm",
        Func    = "NeoCrab_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "NeoCrab_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "neo_lobster_die.frm",
        Func    = "NeoCrab_DieFunc",
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "neo_lobster_die.frm",
        Func    = "NeoCrab_DieLandingFunc",
    },

    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "neo_lobster_stand_up.frm",
        Func    = "NeoCrab_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "neo_lobster_stonecurse.frm",
        Func    = "NeoCrab_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "neo_lobster_stonecurse.frm",
        Func    = "NeoCrab_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "neo_lobster_stonecurse.frm",
		Func	= "NeoCrab_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnNeoCrab_Land",
    Die     = "OnNeoCrab_Die",
    Damage  = "OnNeoCrab_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitNeoCrab( iMonsterIndex )
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
function NeoCrab_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
pMonster:SetDrawSlash( 0, true );
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
        
    end
end

-- �ȱ� ����
function NeoCrab_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function NeoCrab_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- �޸��� ����
function NeoCrab_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- �״»���
function NeoCrab_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetFly( false )
	
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.02 )
		else
			pMonster:SetSpeedX( 0.02 )
		end	
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- �״»��� ����
function NeoCrab_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function NeoCrab_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��01
function NeoCrab_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function NeoCrab_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ�
function NeoCrab_DownFunc( iMonsterIndex, iFrame )
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

-- �ٿ� �ٿ�
function NeoCrab_DownDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 7 ) then
		pMonster:SetNoCheckContact( 15 )
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 5 )		
		pMonster:SetSpeedY( 0.03 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_UP01" )
    end
end

-- �ٿ� �����
function NeoCrab_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function NeoCrab_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function NeoCrab_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 21 ) then
		pMonster:SetNoCheckContact( 5 )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
		pMonster:SetSpeedY( 0.017 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  �������� ����
function NeoCrab_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
    
    if( iFrame >= 0 and iFrame < 4 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
    else
        pMonster:SetSpeedX( 0 )
    end
    if( iFrame == 13 ) then       
        pMonster:PlaySound(1137)
    elseif( iFrame == 17 ) then        
        pMonster:AddDamageWithLocate( DT_MONSTER_NEO_CRAB1, 0.2 )
    end

end

--  �������� 2Ÿ
function NeoCrab_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
    
    if( iFrame >= 0 and iFrame < 4 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    else
        pMonster:SetSpeedX( 0 )
    end
    if( iFrame == 6 ) then       
        pMonster:PlaySound(1137)
    elseif( iFrame == 9 ) then        
        pMonster:AddDamageWithLocate( DT_MONSTER_NEO_CRAB2, 0.2 )
    end
end

--  �������� 3Ÿ
function NeoCrab_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
    
    if( iFrame == 1 ) then       
        pMonster:PlaySound(1138)
    elseif( iFrame == 2 ) then        
        pMonster:AddDamageWithLocate( DT_MONSTER_NEO_CRAB3, 0.2 )
    elseif( iFrame == 30 ) then   
        pMonster:PlaySound(12)     
    elseif( iFrame == 40 ) then        
        pMonster:PlaySound(12)
    
    end
end

--  ���̾
function NeoCrab_Attack201Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
    
    if( iFrame == 35 ) then
        pMonster:AddDamageWithLocate( DT_MONSTER_NEO_LOBSTER_MISSILE, 0.2 )
    end
end

--  ���� ����
function NeoCrab_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "JUMPLANDING" )
    end

end

--  �������� ����
function NeoCrab_HighJumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "JUMPLANDING" )
    end
end

-- ����
function NeoCrab_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ����Ŀ�� �ɷ���
function NeoCrab_StoneCurseFunc( iMonsterIndex, iFrame )
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
function NeoCrab_IceCurseFunc( iMonsterIndex, iFrame )
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
function NeoCrab_HoldFunc( iMonsterIndex, iFrame )
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

function NeoCrab_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -300, 400, 300, -300 ) == true ) then
    
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function NeoCrab_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function NeoCrab_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function NeoCrab_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true ) then
		if( pMonster:CheckTargetInRange( 70, -80, 100, 80, -100 ) == true ) then
			pMonster:SetState( "ATTACK01" )
			pMonster:ResetDelay()
		elseif( pMonster:CheckTargetInRange( 200, -400, 150, 300, -150 ) == true ) then
			pMonster:SetState( "ATTACK201" )
			pMonster:ResetDelay()
		else
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()	
		end
    end    
end

function NeoCrab_Check_WalkStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 70, -80, 100, 80, -100 ) == true ) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function NeoCrab_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -400, 120, 400, -150 ) == true and pMonster:FloatRand() < 0.5 ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function NeoCrab_Check_RunStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -160, 140, 160, -200 ) == true or pMonster:CheckTargetInRange( 400, -300, 200, 300, -250 ) == false ) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function NeoCrab_Check_NextCombo2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    if( pMonster:CheckTargetInRange( 70, -80, 100, 80, -100 ) == true and iFrame == 22 ) then    	
		pMonster:SetState( "ATTACK02" )		
		pMonster:ResetDelay()
    end
end

function NeoCrab_Check_NextCombo3( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 70, -80, 100, 80, -100 ) == true and iFrame == 22 ) then    	
		pMonster:SetState( "ATTACK03" )		
		pMonster:ResetDelay()
    end
end

function NeoCrab_Check_JumpMove( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 350, -50, 100, 50, -100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetNoCheckContact(50)
		pMonster:SetState( "JUMP" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.1 )
		pMonster:SetSpeedY( 0.04 )			
		pMonster:ResetDelay()
	end
end

function NeoCrab_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function NeoCrab_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 70, -80, 100, 80, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function NeoCrab_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 70, -50, 70, 50, -70 ) == false and pMonster:CheckTargetInRange( 200, -200, 150, 200, -150 ) == true and pMonster:GetCountValue() >= 5 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK201" )
		pMonster:ResetDelay()
    end
end

function NeoCrab_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 300, 150, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		NeoCrab_Jump( iMonsterIndex )
		pMonster:SetState( "HIGHJUMP" )
		pMonster:ResetDelay()
    end
end

function NeoCrab_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -300 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function NeoCrab_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function NeoCrab_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function NeoCrab_Check_Idle_Stop( iMonsterIndex, iFrame )
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
function OnNeoCrab_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
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

function OnNeoCrab_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "DIE" )
	end
	
end

function OnNeoCrab_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:AddCountValue(1)	
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
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
		if ( pMonster:FloatRand() < 0.01 and pMonster:GetIsContact() == true and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
			pMonster:SetState( "ATTACK02" )
		end
    end
end

function NeoCrab_Jump( iMonsterIndex )
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

function NeoCrab_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )	
		end
	end
end

function NeoCrab_IdleMoveFail( iMonsterIndex )
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
