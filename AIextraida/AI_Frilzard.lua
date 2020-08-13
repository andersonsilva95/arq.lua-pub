-- AI_Frilzard.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Frilzard_Wait.frm",
        Func    = "Frilzard_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 80,
                AIFunc              = "Frilzard_Check_Targeting",
                DelayFrame          = 100,
            },

            -- Ÿ������
            {
                AICheckFrame        = 300,
                AIFunc              = "Frilzard_Check_ReleaseTarget",
                DelayFrame          = 300,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 30,
                AIFunc              = "Frilzard_Check_TurnToTarget",
                DelayFrame          = 20,
            },

            -- �ȱ�
            {
                AICheckFrame        = 80,
                AIFunc              = "Frilzard_Check_Walk",
                DelayFrame          = 40,
            },

            -- ������
            {
                AICheckFrame        = 42,
                AIFunc              = "Frilzard_Check_JumpUp",
                DelayFrame          = 20,
            },        

            -- �����ٿ�
            {
                AICheckFrame        = 41,
                AIFunc              = "Frilzard_Check_JumpDown",
                DelayFrame          = 10,
            },

            -- ������(�̵�)
            {
                AICheckFrame        = 210,
                AIFunc              = "Frilzard_Check_Idle",
                DelayFrame          = 130,
            },

			-- �ϵ� ���� [75%]
            {
                AICheckFrame        = 30,
                AIFunc              = "Frilzard_Check_Attack01",
                DelayFrame          = 110,
            },

            -- ��ǻ�� ���̺�
            {
                AICheckFrame        = 10,
                AIFunc              = "Frilzard_Check_Attack02",
                DelayFrame          = 110,
            },

		},
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Frilzard_move.frm",
        Func            = "Frilzard_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Frilzard_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 55,
                AIFunc              = "Frilzard_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 120,
                AIFunc              = "Frilzard_Check_ReleaseTarget",
                DelayFrame          = 160,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Frilzard_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- ������
            {
                AICheckFrame        = 75,
                AIFunc              = "Frilzard_Check_JumpUp",
                DelayFrame          = 150,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 120,
                AIFunc              = "Frilzard_Check_JumpDown",
                DelayFrame          = 240,
            },

			-- ���߱�
            {
                AICheckFrame        = 25,
                AIFunc              = "Frilzard_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
    
     -- ������
    {
        ID              = "IDLE",
        Motion          = "Frilzard_move.frm",
        Func            = "Frilzard_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Frilzard_IdleMoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 40,
                AIFunc              = "Frilzard_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ������(����)
            {
                AICheckFrame        = 220,
                AIFunc              = "Frilzard_Check_Idle_Stop",
                DelayFrame          = 100,
            },
        }
    },
        
    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "Frilzard_Attack01.frm",
        Func    = "Frilzard_Attack01Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK02",
        Motion  = "Frilzard_Attack02.frm",
        Func    = "Frilzard_Attack02Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Frilzard_Jump_Up.frm",
        Func    = "Frilzard_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Frilzard_Jump_Down.frm",
        Func    = "Frilzard_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Frilzard_Jump_Landing.frm",
        Func    = "Frilzard_ToWait",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Frilzard_Damage_Up.frm",
        Func    = "Frilzard_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Frilzard_Damage_Middle.frm",
        Func    = "Frilzard_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Frilzard_Damage_Down.frm",
        Func    = "Frilzard_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "Frilzard_Down_Up01.frm",
        Func    = "Frilzard_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Frilzard_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Frilzard_Down_Up02.frm",
        Func    = "Frilzard_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Frilzard_Down_Up03.frm",
        Func    = "Frilzard_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Frilzard_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Frilzard_Down_Middle.frm",
        Func    = "Frilzard_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Frilzard_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "Frilzard_Down_Middle.frm",
        Func    = "Frilzard_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Frilzard_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Frilzard_Down_Special01.frm",
        Func    = "Frilzard_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Frilzard_Down_Special02.frm",
        Func    = "Frilzard_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Frilzard_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Frilzard_down_middle.frm",
        Func    = "Frilzard_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Frilzard_Standup.frm",
        Func    = "Frilzard_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Frilzard_Stone.frm",
        Func    = "Frilzard_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Frilzard_Stone.frm",
        Func    = "Frilzard_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Frilzard_Stone.frm",
		Func	= "Frilzard_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnFrilzard_Land",
    Die     = "OnFrilzard_Die",
    Damage  = "OnFrilzard_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitFrilzard( iMonsterIndex )
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
function Frilzard_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Frilzard_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function Frilzard_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- �׾���
function Frilzard_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- �ױ� ����
function Frilzard_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(990012)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Frilzard_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function Frilzard_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function Frilzard_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function Frilzard_DownUp03Func( iMonsterIndex, iFrame )
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
function Frilzard_DownFunc( iMonsterIndex, iFrame )
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
function Frilzard_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function Frilzard_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Frilzard_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Frilzard_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 81) then
		pMonster:PlaySound(990013)
    elseif( iFrame >= 72 and iFrame <= 170 ) then
		if( iFrame == 72 ) then
			pMonster:StartAttack( 2, PAR_FRONTDOWN_DROPDAMAGE_3, 0.3, 21, 21, 93 )
		end
		
		if ( math.mod( iFrame, 5 ) == 0 ) then
			local posx = 0.0
			local posy = 0.0
			if ( true == pMonster:GetIsRight() ) then
				pMonster:AddTraceParticleToBone( "Frillzard_Dash_Small", 1.0, -1, 8, 8, posx, posy, true )
				pMonster:AddTraceParticleToBone( "Frillzard_Dash_Small", 1.0, -1, 8, 8, posx + 0.3, posy, true )
			else
				posx = posx * -1.0
				pMonster:AddTraceParticleToBone( "Frillzard_Dash_Small_R", 1.0, -1, 8, 8, posx, posy, true )
				pMonster:AddTraceParticleToBone( "Frillzard_Dash_Small_R", 1.0, -1, 8, 8, posx - 0.3, posy, true )
			end
		end
		
		pMonster:SetSpeedX( pMonster:GetRunSpeed() *2 )
	elseif( iFrame == 171) then
		pMonster:EndAttack()
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Frilzard_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 62 ) then
		pMonster:AddDamage( DT_FRILLZARD_SPECIAL_ATK )
		pMonster:PlaySound(990014)
    elseif( iFrame == 65 ) then
		local posx = 0.32
		local posy = 0.25
		if ( true == pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_Small_01", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_Small_02", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_Small_03", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_Small_04", 1.0, -1, 8, 8, posx, posy, true )
		else
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_Small_01", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_Small_02_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_Small_03_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Frillzard_Wave_Small_04_R", 1.0, -1, 8, 8, posx, posy, true )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function Frilzard_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame > 15 and pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetFrameLock( false )
		pMonster:SetState("JUMP_DOWN")
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
	end
	
	if( iFrame == 15 ) then
		Frilzard_Jump( iMonsterIndex )
	end
end

--  ���� �ٿ� ����
function Frilzard_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function Frilzard_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Frilzard_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Frilzard_IceCurseFunc( iMonsterIndex, iFrame )
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
function Frilzard_HoldFunc( iMonsterIndex, iFrame )
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

function Frilzard_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 200, -350, 360, 350, -300 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function Frilzard_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 200, -500, 460, 500, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Frilzard_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Frilzard_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -400, 560, 400, -500 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Frilzard_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -400, 560, 400, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Frilzard_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Frilzard_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 50, 300, -100 ) == true and pMonster:FloatRand() < 0.75 ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Frilzard_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 50, 300, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Frilzard_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 460, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Frilzard_Check_JumpDown( iMonsterIndex, iFrame )
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

function Frilzard_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function Frilzard_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function Frilzard_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnFrilzard_Land( iMonsterIndex )
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

function OnFrilzard_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnFrilzard_Damage( iMonsterIndex )
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
		end
	end
end

function Frilzard_Jump( iMonsterIndex )
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

function Frilzard_MoveFail( iMonsterIndex )
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

function Frilzard_IdleMoveFail( iMonsterIndex )
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
