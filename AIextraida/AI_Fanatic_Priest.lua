-- AI_Fanatic_Priest.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Fanatic_Priest_Wait.frm",
        Func    = "Fanatic_Priest_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 15,
                AIFunc              = "Fanatic_Priest_Check_Targeting",
                DelayFrame          = 15,
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "Fanatic_Priest_Check_ReleaseTarget",
                DelayFrame          = 660,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Fanatic_Priest_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- �̵�
            {
                AICheckFrame        = 110,
                AIFunc              = "Fanatic_Priest_Check_Walk",
                DelayFrame          = 220,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "Fanatic_Priest_Check_RunAway",
                DelayFrame          = 55,
            },
            
            -- ����01
            {
                AICheckFrame        = 55,
                AIFunc              = "Fanatic_Priest_Check_Attack01",
                DelayFrame          = 220,
            },
            
            -- ť��, ��Ȱ
            {
                AICheckFrame        = 35,
                AIFunc              = "Fanatic_Priest_Check_Heal",
                DelayFrame          = 220,
            },
            
            -- ��������
            {
                AICheckFrame        = 75,
                AIFunc              = "Fanatic_Priest_Check_HighJump",
                DelayFrame          = 75,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 220,
                AIFunc              = "Fanatic_Priest_Check_JumpDown",
                DelayFrame          = 220,
            },
            -- ������(�̵�)
            {
                AICheckFrame        = 110,
                AIFunc              = "Fanatic_Priest_Check_Idle",
                DelayFrame          = 110,
            },
        }
    },

    -- ������
    {
        ID      = "IDLE",
        Motion  = "Fanatic_Priest_Move.frm",
        Func    = "Fanatic_Priest_IdleFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Fanatic_Priest_IdleMoveFail",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 55,
                AIFunc              = "Fanatic_Priest_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ������(����)
            {
                AICheckFrame        = 440,
                AIFunc              = "Fanatic_Priest_Check_Idle_Stop",
                DelayFrame          = 440,
            },
        }
    },
    
    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Fanatic_Priest_Move.frm",
        Func    = "Fanatic_Priest_RunFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Fanatic_Priest_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 55,
                AIFunc              = "Fanatic_Priest_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "Fanatic_Priest_Check_ReleaseTarget",
                DelayFrame          = 660,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "Fanatic_Priest_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- ��������
            {
                AICheckFrame        = 75,
                AIFunc              = "Fanatic_Priest_Check_HighJump",
                DelayFrame          = 75,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 220,
                AIFunc              = "Fanatic_Priest_Check_JumpDown",
                DelayFrame          = 220,
            },
             -- ����
            {
                AICheckFrame        = 15,
                AIFunc              = "Fanatic_Priest_Check_WalkStop",
                DelayFrame          = 15,
            },
        }
    },
    
    -- ��������
    {
        ID      = "RUNAWAY",
        Motion  = "Fanatic_Priest_Move.frm",
        Func    = "Fanatic_Priest_RunAwayFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Fanatic_Priest_RunAwayFail",


        Trigger =
        {
             -- ����
            {
                AICheckFrame        = 10,
                AIFunc              = "Fanatic_Priest_Check_RunAwayStop",
                DelayFrame          = 0,
            },
        }
    },
    
    -- ����01
    {
        ID      = "ATTACK01",
        Motion  = "Fanatic_Priest_Attack01.frm",
        Func    = "Fanatic_Priest_Attack01Func",
    },
    
    -- ����02
    {
        ID      = "HEAL",
        Motion  = "Fanatic_Priest_Attack02.frm",
        Func    = "Fanatic_Priest_HealFunc",
    },
    
    -- ����03
    {
        ID      = "RESULLECT",
        Motion  = "Fanatic_Priest_Attack03.frm",
        Func    = "Fanatic_Priest_ResullectFunc",
    },
    
    
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Fanatic_Priest_Jump.frm",
        Func    = "Fanatic_Priest_JumpFunc",
    },

    -- ��������
    {
        ID      = "HIGHJUMP",
        Motion  = "Fanatic_Priest_Jump.frm",
        Func    = "Fanatic_Priest_HighJumpFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Fanatic_Priest_Damage_Up.frm",
        Func    = "Fanatic_Priest_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Fanatic_Priest_Damage_Middle.frm",
        Func    = "Fanatic_Priest_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Fanatic_Priest_Damage_Down.frm",
        Func    = "Fanatic_Priest_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "Fanatic_Priest_Down_Up01.frm",
        Func    = "Fanatic_Priest_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Fanatic_Priest_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Fanatic_Priest_Down_Up02.frm",
        Func    = "Fanatic_Priest_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Fanatic_Priest_Down_Up03.frm",
        Func    = "Fanatic_Priest_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Fanatic_Priest_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Fanatic_Priest_Down_Middle.frm",
        Func    = "Fanatic_Priest_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Fanatic_Priest_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "Fanatic_Priest_Down_Down.frm",
        Func    = "Fanatic_Priest_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Fanatic_Priest_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Fanatic_Priest_Down_Special01.frm",
        Func    = "Fanatic_Priest_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Fanatic_Priest_Down_Special02.frm",
        Func    = "Fanatic_Priest_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Fanatic_Priest_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Fanatic_Priest_Die01.frm",
        Func    = "Fanatic_Priest_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Fanatic_Priest_Die02.frm",
        Func    = "Fanatic_Priest_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },

    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Fanatic_Priest_Standup.frm",
        Func    = "Fanatic_Priest_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Fanatic_Priest_Stone.frm",
        Func    = "Fanatic_Priest_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Fanatic_Priest_Stone.frm",
        Func    = "Fanatic_Priest_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Fanatic_Priest_Stone.frm",
		Func	= "Fanatic_Priest_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnFanatic_Priest_Land",
    Die     = "OnFanatic_Priest_Die",
    Damage  = "OnFanatic_Priest_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitFanatic_Priest( iMonsterIndex )
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
function Fanatic_Priest_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 2 ) then
        pMonster:SetSpeedX( 0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then        
        if( pMonster:IsTarget() ) then        
            pMonster:SetState( "WAIT" ) 
        else
            pMonster:SetState( "IDLE" ) 
        end
    end
end

-- ������ ����
function Fanatic_Priest_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
    
end

-- �޸��� ����
function Fanatic_Priest_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end

end

-- �״»���
function Fanatic_Priest_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LANDING" )
    end
end

-- �״»��� ����
function Fanatic_Priest_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound( 587 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Fanatic_Priest_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function Fanatic_Priest_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function Fanatic_Priest_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ�
function Fanatic_Priest_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
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
function Fanatic_Priest_DownDownFunc( iMonsterIndex, iFrame )
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
function Fanatic_Priest_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function Fanatic_Priest_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Fanatic_Priest_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 21 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �������� ����
function Fanatic_Priest_RunAwayFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUNAWAY" )
    end
end


--  �������� ����
function Fanatic_Priest_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local temp = 0.5
    if( iFrame == 27 ) then
		pMonster:AddParticle( "fireball_start_01", 0.0, temp )
		pMonster:AddParticle( "fireball_start_02", 0.0, temp )
		pMonster:AddParticle( "fireball_start_03", 0.0, temp )
	elseif( iFrame == 37 ) then
		pMonster:AddParticle( "fireball_effect_01", 0.0, temp )
		pMonster:AddParticle( "fireball_effect_02", 0.0, temp )

    elseif( iFrame == 52 ) then
    	pMonster:PlaySound( 588 )
		pMonster:AddDamage( DT_PRIEST_ATK1 ) 				
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �� ���縦 �Ѹ���.
function Fanatic_Priest_HealFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 25 ) then
        pMonster:AddDamage( DT_PRIEST_CURE )
    end
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:ReleaseTarget()
    end
end

function Fanatic_Priest_ResullectFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 25 ) then        
        if( not ( pMonster:GetMonsterTarget() == -1 ) ) then
            local pMonsterTarget = g_MyD3D:GetMonster( pMonster:GetMonsterTarget() )
            local yTemp = 0.1
            pMonsterTarget:AddParticle("native_Resurrection01", 0, -0.2 + yTemp );
            pMonsterTarget:AddParticle("native_Resurrection02", 0, 0.2 + yTemp);
            pMonsterTarget:AddParticle("native_Resurrection03", 0, -0.2 + yTemp );
            pMonsterTarget:SetHP( pMonsterTarget:GetMaxHP() )                            
        end        
    end
    	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:ReleaseTarget()
    end
end

--  ���� ����
function Fanatic_Priest_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end

end

--  �������� ����
function Fanatic_Priest_HighJumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ����Ŀ�� �ɷ���
function Fanatic_Priest_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Fanatic_Priest_IceCurseFunc( iMonsterIndex, iFrame )
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
function Fanatic_Priest_HoldFunc( iMonsterIndex, iFrame )
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

function Fanatic_Priest_Check_Targeting( iMonsterIndex, iFrame )
    
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    -- ��ũ��Ʈ�� ���� ���������� �� �ǰ� �� ���Ϸ� ���� ���Ͱ� �ִ��� ã��, �ִٸ� Ÿ���� �մϴ�.
    local WideBox = KBoundBox()
	WideBox.fTOP = 200
	WideBox.fLEFT = -500
	WideBox.fRIGHT = 500
	WideBox.fBOTTOM = -100
	
	local TallBox = KBoundBox()
	TallBox.fTOP = 500
	TallBox.fLEFT = -200
	TallBox.fRIGHT = 200
	TallBox.fBOTTOM = -400
		
	for i = 0, MAX_MONSTER - 1 do
		local pTarget = g_MyD3D:GetMonster( i )
		if ( pMonster:IsBoxIn( 100,0,WideBox,pTarget ) == true or pMonster:IsBoxIn( 0,0,TallBox,pTarget ) == true ) then		    
			if( pTarget:IsLive() == true and pTarget:GetHP() < pTarget:GetMaxHP() ) then
				pMonster:SetMonsterTargetManual( i );
				pMonster:TurnToTarget()		
				if( pMonster:CheckState( "IDLE" ) == true ) then
					pMonster:SetState( "WAIT" )
				end
				pMonster:ResetDelay()
				break
			end			
		end
    end
    
    --[[
    if( pMonster:IsTarget() ) then -- Ÿ���� �߰� ���� �ٷ� �����̿� �÷��� �ִٸ� ������ �켱
        if( pMonster:SetTarget( 100, -200, 200, 200, -100 ) == true ) then
            pMonster:TurnToTarget()
    		
		    if( pMonster:CheckState( "IDLE" ) == true ) then
			    pMonster:SetState( "WAIT" )
		    end		
        pMonster:ResetDelay()
        end
    else]]                            -- Ÿ���� �� ���Ͱ� ������ �÷��̾�� ��´�       
    --if( not pMonster:IsTarget() ) then
        if( pMonster:SetTarget( 200, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -300 ) == true ) then
		    pMonster:TurnToTarget()
    		
		    if( pMonster:CheckState( "IDLE" ) == true ) then
			    pMonster:SetState( "WAIT" )
		    end		
        pMonster:ResetDelay()
        end
    --end
       
    
end

function Fanatic_Priest_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function Fanatic_Priest_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( not( pMonster:GetTarget() == -1 ) ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Fanatic_Priest_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    --Ÿ���� ������ ���� �÷��̾��� ��츦 ����� ó�� �ؾ� �Ѵ�.
    if( pMonster:IsTargetMonster() ) then
        if( pMonster:CheckTargetInRange( 150, -100, 400, 650, -100 ) == true ) then
			    pMonster:TurnToTarget()
                pMonster:SetState( "WALK" )
                pMonster:ResetDelay()
        end
    
    else
        --Ÿ���� �÷��̾��ΰ��
        if( pMonster:CheckTargetInRange( 650, -250, 400, 450, -100 ) == true and pMonster:CheckTargetInRange( 0, -100, 100, 100, -150 ) == false and pMonster:FloatRand() < 0.7 ) then
			    pMonster:TurnToTarget()
                pMonster:SetState( "WALK" )
                pMonster:ResetDelay()
        end
    end
end

function Fanatic_Priest_Check_WalkStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -250, 900, 250, -900 ) == true ) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function Fanatic_Priest_Check_RunAway( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -200, 250, 200, -250 ) == true and pMonster:IsTargetMonster() == false ) then
			pMonster:TurnToTarget()
			pMonster:Turn()
			
            pMonster:SetState( "RUNAWAY" )
            pMonster:ResetDelay()
    end
end


function Fanatic_Priest_Check_RunAwayStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -350, 250, 350, -250 ) == false ) then
    	pMonster:SetSpeedX( 0.0 )
    	pMonster:TurnToTarget()
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end


function Fanatic_Priest_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Fanatic_Priest_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -200, 100, 400, -100 ) == true and pMonster:IsTargetMonster() == false ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Fanatic_Priest_Check_Heal( iMonsterIndex, iFrame )
    --print( "Fanatic_Priest_Check_Heal" )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    if( pMonster:IsTargetMonster() == true and pMonster:CheckTargetInRange( 150, -400, 180, 400, -130 ) == true ) then
        local pMonsterTarget = g_MyD3D:GetMonster( pMonster:GetMonsterTarget() )
        
        if( pMonsterTarget:GetHP() <= 0 ) then            
		    pMonster:SetState( "RESULLECT" )		
		    pMonster:ResetDelay()	
		else		    
		    pMonster:SetState( "HEAL" )
		    pMonster:ResetDelay()	
		end
    end
end

function Fanatic_Priest_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -150, 40, 150, 940 ) == true and pMonster:GetIsContact() == true ) then
		Fanatic_Priest_Jump( iMonsterIndex )
		pMonster:SetState( "HIGHJUMP" )
		pMonster:ResetDelay()
    end
end

function Fanatic_Priest_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -100, -40, 100, -940 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Fanatic_Priest_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������.. 
function Fanatic_Priest_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
		pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function Fanatic_Priest_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnFanatic_Priest_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
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

function OnFanatic_Priest_Die( iMonsterIndex )
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

function OnFanatic_Priest_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:AddCountValue(1)
	pMonster:PlaySound( 586 )
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
end

function Fanatic_Priest_Jump( iMonsterIndex )
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

function Fanatic_Priest_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.06) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.3 )			
			pMonster:SetSpeedY( 0.045 )			
		else
			pMonster:SetNoCheckContact(11)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.008 )		
		end
	end
end

function Fanatic_Priest_RunAwayFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.06) > pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.3 )			
			pMonster:SetSpeedY( 0.045 )			
		else
			pMonster:SetNoCheckContact(11)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.008 )		
		end
	end
end


function Fanatic_Priest_IdleMoveFail( iMonsterIndex )
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

