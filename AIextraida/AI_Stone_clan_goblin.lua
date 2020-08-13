-- AI_Stone_clan_goblin.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Stone_clan_goblin_Wait.frm",
        Func    = "Stone_clan_goblin_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 80,
                AIFunc              = "Stone_clan_goblin_Check_Targeting",
                DelayFrame          = 60,
            },

            -- Ÿ������
            {
                AICheckFrame        = 150,
                AIFunc              = "Stone_clan_goblin_Check_ReleaseTarget",
                DelayFrame          = 200,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 30,
                AIFunc              = "Stone_clan_goblin_Check_TurnToTarget",
                DelayFrame          = 30,
            },

            -- �ȱ�
            {
                AICheckFrame        = 40,
                AIFunc              = "Stone_clan_goblin_Check_Walk",
                DelayFrame          = 20,
            },

            -- ������
            {
                AICheckFrame        = 35,
                AIFunc              = "Stone_clan_goblin_Check_JumpUp",
                DelayFrame          = 30,
            },

            -- �����ٿ�
            {
                AICheckFrame        = 31,
                AIFunc              = "Stone_clan_goblin_Check_JumpDown",
                DelayFrame          = 20,
            },

            -- ������(�̵�)
            {
                AICheckFrame        = 110,
                AIFunc              = "Stone_clan_goblin_Check_Idle",
                DelayFrame          = 110,
            },

			-- ���� ��
            {
                AICheckFrame        = 25,
                AIFunc              = "Stone_clan_goblin_Check_Attack01",
                DelayFrame          = 95,
            },

            -- �� ��
            {
                AICheckFrame        = 44,
                AIFunc              = "Stone_clan_goblin_Check_Attack02",
                DelayFrame          = 222,
            },
		},
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Stone_clan_goblin_Run.frm",
        Func            = "Stone_clan_goblin_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Stone_clan_goblin_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 55,
                AIFunc              = "Stone_clan_goblin_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 70,
                AIFunc              = "Stone_clan_goblin_Check_ReleaseTarget",
                DelayFrame          = 140,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 20,
                AIFunc              = "Stone_clan_goblin_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- ������
            {
                AICheckFrame        = 25,
                AIFunc              = "Stone_clan_goblin_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 24,
                AIFunc              = "Stone_clan_goblin_Check_JumpDown",
                DelayFrame          = 20,
            },
			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "Stone_clan_goblin_Check_Stop",
                DelayFrame          = 50,
            },

            -- ������(�̵�)
            {
                AICheckFrame        = 90,
                AIFunc              = "Stone_clan_goblin_Check_Idle",
                DelayFrame          = 100,
            },
        }
    },
    
     -- ������
    {
        ID              = "IDLE",
        Motion          = "Stone_clan_goblin_Walk.frm",
        Func            = "Stone_clan_goblin_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Stone_clan_goblin_IdleMoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 50,
                AIFunc              = "Stone_clan_goblin_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ������(����)
            {
                AICheckFrame        = 220,
                AIFunc              = "Stone_clan_goblin_Check_Idle_Stop",
                DelayFrame          = 200,
            },
        }
    },

    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "Stone_clan_goblin_Attack01.frm",
        Func    = "Stone_clan_goblin_Attack01Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK02",
        Motion  = "Stone_clan_goblin_Attack02.frm",
        Func    = "Stone_clan_goblin_Attack02Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Stone_clan_goblin_Jump_Up.frm",
        Func    = "Stone_clan_goblin_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Stone_clan_goblin_Jump_Down.frm",
        Func    = "Stone_clan_goblin_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Stone_clan_goblin_Jump_Landing.frm",
        Func    = "Stone_clan_goblin_ToWait",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Stone_clan_goblin_Damage_Up.frm",
        Func    = "Stone_clan_goblin_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Stone_clan_goblin_Damage_Middle.frm",
        Func    = "Stone_clan_goblin_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Stone_clan_goblin_Damage_Down.frm",
        Func    = "Stone_clan_goblin_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "Stone_clan_goblin_Down_Up01.frm",
        Func    = "Stone_clan_goblin_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Stone_clan_goblin_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Stone_clan_goblin_Down_Up02.frm",
        Func    = "Stone_clan_goblin_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Stone_clan_goblin_Down_Up03.frm",
        Func    = "Stone_clan_goblin_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Stone_clan_goblin_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Stone_clan_goblin_Down_Middle.frm",
        Func    = "Stone_clan_goblin_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Stone_clan_goblin_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "Stone_clan_goblin_Down_Middle.frm",
        Func    = "Stone_clan_goblin_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Stone_clan_goblin_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Stone_clan_goblin_Down_Special01.frm",
        Func    = "Stone_clan_goblin_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Stone_clan_goblin_Down_Special02.frm",
        Func    = "Stone_clan_goblin_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Stone_clan_goblin_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Stone_clan_goblin_down_middle.frm",
        Func    = "Stone_clan_goblin_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Stone_clan_goblin_Standup.frm",
        Func    = "Stone_clan_goblin_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Stone_clan_goblin_Stone.frm",
        Func    = "Stone_clan_goblin_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Stone_clan_goblin_Stone.frm",
        Func    = "Stone_clan_goblin_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Stone_clan_goblin_Stone.frm",
		Func	= "Stone_clan_goblin_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnStone_clan_goblin_Land",
    Die     = "OnStone_clan_goblin_Die",
    Damage  = "OnStone_clan_goblin_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitStone_clan_goblin( iMonsterIndex )
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
function Stone_clan_goblin_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Stone_clan_goblin_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function Stone_clan_goblin_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- �׾���
function Stone_clan_goblin_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- �ױ� ����
function Stone_clan_goblin_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetSpeedX(0)

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(994001)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Stone_clan_goblin_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function Stone_clan_goblin_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function Stone_clan_goblin_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function Stone_clan_goblin_DownUp03Func( iMonsterIndex, iFrame )
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
function Stone_clan_goblin_DownFunc( iMonsterIndex, iFrame )
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
function Stone_clan_goblin_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function Stone_clan_goblin_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Stone_clan_goblin_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Stone_clan_goblin_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 62 ) then
		pMonster:ComputeAngleToTarget( 0.0, -0.14 ) -- Ÿ�������� ������ ���
        angle = pMonster:GetAngleToTarget()
        if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
        end
        pMonster:AddDamageWithLocateAngle( DT_STONE_GOBLIN_THROW_STONE, 0.0, 0.0, false, angle )
    elseif( iFrame == 65 ) then
		pMonster:PlaySound(994002)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��������2 ����
function Stone_clan_goblin_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 25 ) then
		pMonster:AddDamage(DT_STONE_GOBLIN_ROCKSHOT_MOTION)
	elseif( iFrame == 40 ) then
		pMonster:AddTraceParticleToBone( "Goblin_Dustdown", 1.0, 16, 8, 8, 0.0, 0.0, true )
    elseif( iFrame == 123 ) then
		pMonster:AddDamage( DT_STONE_GOBLIN_ROCKSHOT )
	elseif( iFrame == 126 ) then
		pMonster:PlaySound(994003)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end


--  ���� ����
function Stone_clan_goblin_JumpFunc( iMonsterIndex, iFrame )
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
function Stone_clan_goblin_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function Stone_clan_goblin_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Stone_clan_goblin_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Stone_clan_goblin_IceCurseFunc( iMonsterIndex, iFrame )
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
function Stone_clan_goblin_HoldFunc( iMonsterIndex, iFrame )
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

function Stone_clan_goblin_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -300, 200, 300, -100 ) == true or pMonster:SetTarget( 0, -200, 260, 200, -250 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function Stone_clan_goblin_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -500, 350, 500, -250 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Stone_clan_goblin_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Stone_clan_goblin_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 500, -150, 350, 150, -250 ) == true and pMonster:FloatRand() < 0.7) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
	end
end

function Stone_clan_goblin_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 50, -250, 180, 250, -200 ) == true ) then
	
		if ( pMonster:FloatRand() < 0.8) then				
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WAIT" )
		end
		pMonster:ResetDelay()
	end
end

function Stone_clan_goblin_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Stone_clan_goblin_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 350, -180, 160, 180, -220 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Stone_clan_goblin_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 50, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Stone_clan_goblin_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 350, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Stone_clan_goblin_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Stone_clan_goblin_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -150, -100, 150, -360 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function Stone_clan_goblin_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function Stone_clan_goblin_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function Stone_clan_goblin_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnStone_clan_goblin_Land( iMonsterIndex )
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

function OnStone_clan_goblin_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnStone_clan_goblin_Damage( iMonsterIndex )
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
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK01" )
			pMonster:SetSuperArmor( true )
		end
	end
end

function Stone_clan_goblin_Jump( iMonsterIndex )
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

function Stone_clan_goblin_MoveFail( iMonsterIndex )
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

function Stone_clan_goblin_IdleMoveFail( iMonsterIndex )
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
