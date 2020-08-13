-- AI_goblin_blacksmith.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "goblin_blacksmith_Wait.frm",
        Func    = "goblin_blacksmith_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 60,
                AIFunc              = "goblin_blacksmith_Check_Targeting",
                DelayFrame          = 80,
            },

            -- Ÿ������
            {
                AICheckFrame        = 250,
                AIFunc              = "goblin_blacksmith_Check_ReleaseTarget",
                DelayFrame          = 50,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 30,
                AIFunc              = "goblin_blacksmith_Check_TurnToTarget",
                DelayFrame          = 30,
            },

            -- �ȱ�
            {
                AICheckFrame        = 33,
                AIFunc              = "goblin_blacksmith_Check_Walk",
                DelayFrame          = 10,
            },

            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "goblin_blacksmith_Check_JumpUp",
                DelayFrame          = 30,
            },

            -- �����ٿ�
            {
                AICheckFrame        = 22,
                AIFunc              = "goblin_blacksmith_Check_JumpDown",
                DelayFrame          = 30,
            },

            -- ������(�̵�)
            {
                AICheckFrame        = 110,
                AIFunc              = "goblin_blacksmith_Check_Idle",
                DelayFrame          = 110,
            },

			-- ��ο� ����
            {
                AICheckFrame        = 25,
                AIFunc              = "goblin_blacksmith_Check_Attack01",
                DelayFrame          = 150,
            },

            -- ũ���� ����
            {
                AICheckFrame        = 10,
                AIFunc              = "goblin_blacksmith_Check_Attack02",
                DelayFrame          = 110,
            },
		},
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "goblin_blacksmith_walk.frm",
        Func            = "goblin_blacksmith_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "goblin_blacksmith_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 60,
                AIFunc              = "goblin_blacksmith_Check_Targeting",
                DelayFrame          = 40,
            },
            -- Ÿ������
            {
                AICheckFrame        = 200,
                AIFunc              = "goblin_blacksmith_Check_ReleaseTarget",
                DelayFrame          = 100,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 30,
                AIFunc              = "goblin_blacksmith_Check_TurnToTarget",
                DelayFrame          = 30,
            },
            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "goblin_blacksmith_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 20,
                AIFunc              = "goblin_blacksmith_Check_JumpDown",
                DelayFrame          = 30,
            },
			-- ���߱�
            {
                AICheckFrame        = 5,
                AIFunc              = "goblin_blacksmith_Check_Stop",
                DelayFrame          = 20,
            },

            -- ������(�̵�)
            {
                AICheckFrame        = 80,
                AIFunc              = "goblin_blacksmith_Check_Idle",
                DelayFrame          = 99,
            },
        }
    },
    
     -- ������
    {
        ID              = "IDLE",
        Motion          = "goblin_blacksmith_walk.frm",
        Func            = "goblin_blacksmith_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "goblin_blacksmith_IdleMoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 40,
                AIFunc              = "goblin_blacksmith_Check_Targeting",
                DelayFrame          = 80,
            },
            -- ������(����)
            {
                AICheckFrame        = 220,
                AIFunc              = "goblin_blacksmith_Check_Idle_Stop",
                DelayFrame          = 140,
            },
        }
    },
        
    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "goblin_blacksmith_Attack01.frm",
        Func    = "goblin_blacksmith_Attack01Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK02",
        Motion  = "goblin_blacksmith_Attack02.frm",
        Func    = "goblin_blacksmith_Attack02Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "goblin_blacksmith_Jump_Up.frm",
        Func    = "goblin_blacksmith_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "goblin_blacksmith_Jump_Down.frm",
        Func    = "goblin_blacksmith_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "goblin_blacksmith_Jump_Landing.frm",
        Func    = "goblin_blacksmith_ToWait",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "goblin_blacksmith_Damage_Up.frm",
        Func    = "goblin_blacksmith_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "goblin_blacksmith_Damage_Middle.frm",
        Func    = "goblin_blacksmith_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "goblin_blacksmith_Damage_Down.frm",
        Func    = "goblin_blacksmith_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "goblin_blacksmith_Down_Up01.frm",
        Func    = "goblin_blacksmith_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "goblin_blacksmith_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "goblin_blacksmith_Down_Up02.frm",
        Func    = "goblin_blacksmith_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "goblin_blacksmith_Down_Up03.frm",
        Func    = "goblin_blacksmith_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "goblin_blacksmith_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "goblin_blacksmith_Down_Middle.frm",
        Func    = "goblin_blacksmith_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "goblin_blacksmith_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "goblin_blacksmith_Down_Middle.frm",
        Func    = "goblin_blacksmith_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "goblin_blacksmith_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "goblin_blacksmith_Down_Special01.frm",
        Func    = "goblin_blacksmith_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "goblin_blacksmith_Down_Special02.frm",
        Func    = "goblin_blacksmith_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "goblin_blacksmith_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "goblin_blacksmith_down_middle.frm",
        Func    = "goblin_blacksmith_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "goblin_blacksmith_Standup.frm",
        Func    = "goblin_blacksmith_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Stone_clan_goblin_fighter_stone.frm",
        Func    = "goblin_blacksmith_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Stone_clan_goblin_fighter_stone.frm",
        Func    = "goblin_blacksmith_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Stone_clan_goblin_fighter_stone.frm",
		Func	= "goblin_blacksmith_HoldFunc",
	},
}

CallBack =
{
    Land    = "Ongoblin_blacksmith_Land",
    Die     = "Ongoblin_blacksmith_Die",
    Damage  = "Ongoblin_blacksmith_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function Initgoblin_blacksmith( iMonsterIndex )
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
    
    --pMonster:AddTraceParticleToBone( "Smith_Flame_01", 1.0, 16, 6, 8, 0.1, 0.0)
	--pMonster:AddTraceParticleToBone( "Smith_Flame_02", 1.0, 16, 6, 8, 0.1, 0.0 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function goblin_blacksmith_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function goblin_blacksmith_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function goblin_blacksmith_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- �׾���
function goblin_blacksmith_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- �ױ� ����
function goblin_blacksmith_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetSpeedX(0)

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(992007)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function goblin_blacksmith_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function goblin_blacksmith_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function goblin_blacksmith_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function goblin_blacksmith_DownUp03Func( iMonsterIndex, iFrame )
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
function goblin_blacksmith_DownFunc( iMonsterIndex, iFrame )
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
function goblin_blacksmith_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function goblin_blacksmith_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function goblin_blacksmith_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function goblin_blacksmith_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 54 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.0 ) -- Ÿ�������� ������ ���
        angle = pMonster:GetAngleToTarget()
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
        end
        pMonster:AddDamageWithLocateAngle( DT_FIRE_HAMMER_SMITH_DRAW_ATK, 0.0, 0.2, false, angle )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��������2 ����
function goblin_blacksmith_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 50 ) then
		pMonster:AddDamage(DT_FIRE_HAMMER_SMITH_CRASH_ATK)
		pMonster:PlaySound(992009)
	elseif( iFrame == 53 ) then
		local posx = 0.2
		local posy = 0.0
		if ( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Goblin_Smalldust_R", 1.0, -1, 8, 8, posx, posy, true )
		else
			pMonster:AddTraceParticleToBone( "Goblin_Smalldust", 1.0, -1, 8, 8, posx, posy )
		end

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end


--  ���� ����
function goblin_blacksmith_JumpFunc( iMonsterIndex, iFrame )
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
function goblin_blacksmith_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function goblin_blacksmith_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function goblin_blacksmith_StoneCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function goblin_blacksmith_IceCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function goblin_blacksmith_HoldFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE_LANDING" )
		end
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function goblin_blacksmith_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 110, -300, 260, 300, -250 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function goblin_blacksmith_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -500, 350, 500, -350 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function goblin_blacksmith_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function goblin_blacksmith_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 410, -230, 350, 230, -300 ) == true and pMonster:FloatRand() < 0.75) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
	end
end

function goblin_blacksmith_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 50, -200, 350, 200, -300 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function goblin_blacksmith_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function goblin_blacksmith_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 350, -180, 200, 180, -240 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function goblin_blacksmith_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -100, 50, 100, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function goblin_blacksmith_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 350, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		goblin_blacksmith_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function goblin_blacksmith_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -150, -100, 150, -380 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function goblin_blacksmith_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function goblin_blacksmith_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function goblin_blacksmith_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function Ongoblin_blacksmith_Land( iMonsterIndex )
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

function Ongoblin_blacksmith_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function Ongoblin_blacksmith_Damage( iMonsterIndex )
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
		if ( pMonster:FloatRand() < 0.1 and pMonster:GetIsContact() == true ) then
			pMonster:TurnToTarget()

			if( pMonster:CheckTargetInRange( 100, -100, 50, 100, -100 ) == true ) then
				pMonster:SetState( "ATTACK02" )
			else
				pMonster:SetState( "ATTACK01" )
			end
		end
	end
end

function goblin_blacksmith_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function goblin_blacksmith_MoveFail( iMonsterIndex )
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

function goblin_blacksmith_IdleMoveFail( iMonsterIndex )
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
