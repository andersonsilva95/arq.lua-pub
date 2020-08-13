-- AI_SkeletonKnight.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "SkeletonKnight_Wait.frm",
        Func    = "SkeletonKnight_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "SkeletonKnight_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "SkeletonKnight_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 75,
                AIFunc              = "SkeletonKnight_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- �ȱ�
            {
                AICheckFrame        = 110,
                AIFunc              = "SkeletonKnight_Check_Walk",
                DelayFrame          = 220,
            },
            -- ��������02
            {
                AICheckFrame        = 55,
                AIFunc              = "SkeletonKnight_Check_Attack02",
                DelayFrame          = 220,
            },
            -- ��������
            {
                AICheckFrame        = 75,
                AIFunc              = "SkeletonKnight_Check_HighJump",
                DelayFrame          = 75,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 220,
                AIFunc              = "SkeletonKnight_Check_JumpDown",
                DelayFrame          = 220,
            },
            -- ������(�̵�)
            {
                AICheckFrame        = 110,
                AIFunc              = "SkeletonKnight_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "SkeletonKnight_Walk.frm",
        Func    = "SkeletonKnight_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "SkeletonKnight_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 55,
                AIFunc              = "SkeletonKnight_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "SkeletonKnight_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- ��������01
            {
                AICheckFrame        = 1,
                AIFunc              = "SkeletonKnight_Check_Attack01",
                DelayFrame          = 0,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "SkeletonKnight_Check_HighJump",
                DelayFrame          = 55,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 150,
                AIFunc              = "SkeletonKnight_Check_JumpDown",
                DelayFrame          = 150,
            },
			-- ���߱�
            {
                AICheckFrame        = 55,
                AIFunc              = "SkeletonKnight_Check_WalkStop",
                DelayFrame          = 55,
            },
        }
    },
    
     -- ������
    {
        ID              = "IDLE",
        Motion          = "SkeletonKnight_Wait.frm",
        Func            = "SkeletonKnight_IdleFunc",

        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "SkeletonKnight_Check_Targeting",
                DelayFrame          = 110,
            },
        }
    },
    
    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "SkeletonKnight_Attack01.frm",
        Func    = "SkeletonKnight_Attack01Func",
    },
    
    -- ��������02
    {
        ID      = "ATTACK02",
        Motion  = "SkeletonKnight_Attack02.frm",
        Func    = "SkeletonKnight_Attack02Func",
    },
    
    -- ī���;���
    {
        ID      = "COUNTER_ATTACK",
        Motion  = "SkeletonKnight_CounterAttack.frm",
        Func    = "SkeletonKnight_CounterAttackFunc",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "SkeletonKnight_Jump.frm",
        Func    = "SkeletonKnight_JumpFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "SkeletonKnight_Damage_Up.frm",
        Func    = "SkeletonKnight_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "SkeletonKnight_Damage_Middle.frm",
        Func    = "SkeletonKnight_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "SkeletonKnight_Damage_Down.frm",
        Func    = "SkeletonKnight_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "SkeletonKnight_Down_Up01.frm",
        Func    = "SkeletonKnight_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "SkeletonKnight_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "SkeletonKnight_Down_Up02.frm",
        Func    = "SkeletonKnight_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "SkeletonKnight_Down_Up03.frm",
        Func    = "SkeletonKnight_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "SkeletonKnight_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "SkeletonKnight_Down_Middle.frm",
        Func    = "SkeletonKnight_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "SkeletonKnight_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "SkeletonKnight_Down_Down.frm",
        Func    = "SkeletonKnight_DownDownFunc",

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "SkeletonKnight_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "SkeletonKnight_Down_Special01.frm",
        Func    = "SkeletonKnight_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "SkeletonKnight_Down_Special02.frm",
        Func    = "SkeletonKnight_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "SkeletonKnight_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "SkeletonKnight_Die01.frm",
        Func    = "SkeletonKnight_DieFunc",
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "SkeletonKnight_Die02.frm",
        Func    = "SkeletonKnight_DieLandingFunc",
    },

    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "SkeletonKnight_Standup.frm",
        Func    = "SkeletonKnight_StandupFunc",
    },
    
    -- ������
    {
        ID      = "STANDUP_ATTACK",
        Motion  = "SkeletonKnight_StandupAttack.frm",
        Func    = "SkeletonKnight_StandupAttackFunc",
    },  
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "SkeletonKnight_Stone.frm",
        Func    = "SkeletonKnight_StoneCurseFunc",
    },  
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "SkeletonKnight_Stone.frm",
        Func    = "SkeletonKnight_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "SkeletonKnight_Stone.frm",
		Func	= "SkeletonKnight_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnSkeletonKnight_Land",
    Die     = "OnSkeletonKnight_Die",
    Damage  = "OnSkeletonKnight_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitSkeletonKnight( iMonsterIndex )
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
function SkeletonKnight_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �ȱ� ����
function SkeletonKnight_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function SkeletonKnight_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )        
    end
end

-- �״»���
function SkeletonKnight_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LANDING" )
    end
end

-- �״»��� ����
function SkeletonKnight_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function SkeletonKnight_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function SkeletonKnight_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function SkeletonKnight_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function SkeletonKnight_DownUp03Func( iMonsterIndex, iFrame )
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

-- �ٿ�
function SkeletonKnight_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
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
function SkeletonKnight_DownDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 7 ) then
		pMonster:SetNoCheckContact( 15 )
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 5 )		
		pMonster:SetSpeedY( 0.032 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
			pMonster:SetState( "DOWN_UP01" )
    end
end

-- �ٿ� �����
function SkeletonKnight_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function SkeletonKnight_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
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
function SkeletonKnight_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 31 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.8 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- ������
function SkeletonKnight_StandupAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 40 ) then
		pMonster:PlaySound(372)
		pMonster:SetNoCheckContact(46)
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 0.6 )
		pMonster:SetSpeedY( 0.04 )
		pMonster:PlaySound(372)
	elseif( iFrame == 59 ) then
		pMonster:AddDamage( DT_MONSTER_SKELETONKNIGHT01 )
	elseif( iFrame == 73 ) then
		pMonster:AddDamage( DT_MONSTER_SKELETONKNIGHT01 )
	elseif( iFrame == 87 ) then
		pMonster:AddDamage( DT_MONSTER_SKELETONKNIGHT01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  ��������01 ����
function SkeletonKnight_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
	elseif( iFrame == 18 ) then
		pMonster:PlaySound(372)		
		pMonster:AddDamage( DT_MONSTER_SKELETONKNIGHT01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��������02 ����
function SkeletonKnight_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame == 38 ) then		
		pMonster:AddDamage( DT_MONSTER_SKELETONKNIGHT02_01 )
		pMonster:PlaySound(372)
	elseif( iFrame == 51 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		pMonster:AddDamage( DT_MONSTER_SKELETONKNIGHT02_01 )
		pMonster:PlaySound(372)
	elseif( iFrame == 72 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		pMonster:AddDamage( DT_MONSTER_SKELETONKNIGHT02_01 )
		pMonster:PlaySound(372)
	elseif( iFrame == 95 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		pMonster:AddDamage( DT_MONSTER_SKELETONKNIGHT02_01 )
		pMonster:PlaySound(372)
	elseif( iFrame == 131 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		pMonster:AddDamage( DT_MONSTER_SKELETONKNIGHT02_02 )
		pMonster:PlaySound(372)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ī���Ͱ��� ����
function SkeletonKnight_CounterAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 56 ) then
		pMonster:PlaySound(372)
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	elseif( iFrame == 58 ) then		
		pMonster:AddDamage( DT_MONSTER_SKELETONKNIGHT03 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function SkeletonKnight_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "JUMP" )
    end
end

--  ����Ŀ�� �ɷ���
function SkeletonKnight_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
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
function SkeletonKnight_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
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
function SkeletonKnight_HoldFunc( iMonsterIndex, iFrame )
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

function SkeletonKnight_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function SkeletonKnight_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function SkeletonKnight_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function SkeletonKnight_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function SkeletonKnight_Check_WalkStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -400, 200, 400, -100 ) == false ) then
		pMonster:TurnToTarget()
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function SkeletonKnight_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function SkeletonKnight_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 100, 100, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function SkeletonKnight_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 100, 150, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function SkeletonKnight_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 300, 150, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		SkeletonKnight_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function SkeletonKnight_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, -40, 100, -200 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function SkeletonKnight_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:CheckTargetInRange( 200, -200, 200, 200, -100 ) == true ) then
			if ( pMonster:FloatRand() < 0.5) then				
				pMonster:SetState( "STANDUP_ATTACK" )
			else
				pMonster:SetState( "STANDUP" )
			end			
		else
			pMonster:SetState( "STANDUP" )
		end
    end
end

function SkeletonKnight_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnSkeletonKnight_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (1.0 / 2.0) )

    if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end
end

function OnSkeletonKnight_Die( iMonsterIndex )
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

function OnSkeletonKnight_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	
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

function SkeletonKnight_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function SkeletonKnight_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.446) < pMonster:GetTargetY() )then			
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