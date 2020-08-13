-- AI_BlackWendy.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "BlackWendy_Wait.frm",
        Func    = "BlackWendy_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 50,
                AIFunc              = "BlackWendy_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "BlackWendy_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- �ȱ�
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackWendy_Check_Walk",
                DelayFrame          = 75,
            },
             -- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "BlackWendy_Check_HighJump",
                DelayFrame          = 75,
            }, 
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackWendy_Check_JumpDown",
                DelayFrame          = 100,
            }, 

            -- Ÿ���� ���Ͽ� ����
            {
                AICheckFrame        = 35,
                AIFunc              = "BlackWendy_Check_TurnToTarget",
                DelayFrame          = 35,
            },                        
            -- ��������
            {
                AICheckFrame        = 50,
                AIFunc              = "BlackWendy_Check_Attack01",
                DelayFrame          = 500,
            },
            -- ��������
            {
                AICheckFrame        = 110,
                AIFunc              = "BlackWendy_Check_Attack03",
                DelayFrame          = 2000,
            },
            -- ������극��
            {
                AICheckFrame        = 120,
                AIFunc              = "BlackWendy_Check_Attack04",
                DelayFrame          = 800,
            },

        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "BlackWendy_Move.frm",
        Func    = "BlackWendy_WalkFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackWendy_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ���� ���Ͽ� ����
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackWendy_Check_TurnToTarget",
                DelayFrame          = 110,
            },  
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackWendy_Check_Attack01",
                DelayFrame          = 500,
            },
            -- ���������
            {
                AICheckFrame        = 100,
                AIFunc              = "BlackWendy_Check_Attack02",
                DelayFrame          = 1000,
            },
             -- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "BlackWendy_Check_HighJump",
                DelayFrame          = 75,
            }, 
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "BlackWendy_Check_JumpDown",
                DelayFrame          = 100,
            }, 
			-- ���߱�
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackWendy_Check_Stop",
                DelayFrame          = 30,
            },
        }
    },

    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "BlackWendy_Attack03.frm",
        Func    = "BlackWendy_Attack01Func",
    },

    -- ���������
    {
        ID      = "ATTACK02",
        Motion  = "BlackWendy_Attack02.frm",
        Func    = "BlackWendy_Attack02Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK03",
        Motion  = "BlackWendy_Attack04.frm",
        Func    = "BlackWendy_Attack03Func",
    },
    
    -- ������극��
    {
        ID      = "ATTACK04",
        Motion  = "BlackWendy_Attack01.frm",
        Func    = "BlackWendy_Attack04Func",
    },
    
    -- �������� �ö󰡴»���
    {
        ID      = "HIGHJUMP_UP",
        Motion  = "BlackWendy_Jump.frm",
        Func    = "BlackWendy_HighJumpUpFunc",
    },
    
    -- �������� ����
    {
        ID      = "HIGHJUMP_LANDING",
        Motion  = "BlackWendy_Jump_Landing.frm",
        Func    = "BlackWendy_HighJumpLandingFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "BlackWendy_Damage_Up.frm",
        Func    = "BlackWendy_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "BlackWendy_Damage_Middle.frm",
        Func    = "BlackWendy_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "BlackWendy_Damage_Down.frm",
        Func    = "BlackWendy_DamageFunc",
    },
    
    -- �ٿ� ��01
    {
        ID      = "DOWN_UP01",
        Motion  = "BlackWendy_Down_Up01.frm",
        Func    = "BlackWendy_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "BlackWendy_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "BlackWendy_Down_Up02.frm",
        Func    = "BlackWendy_DownUpFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "BlackWendy_Down_Up03.frm",
        Func    = "BlackWendy_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackWendy_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �� 
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "BlackWendy_Down_Middle.frm",
        Func    = "BlackWendy_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackWendy_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �� 
    {
        ID      = "DOWN_DOWN",
        Motion  = "BlackWendy_Down_Down.frm",
        Func    = "BlackWendy_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "BlackWendy_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
     -- �ٿ� ����� 
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "BlackWendy_Down_Special01.frm",
        Func    = "BlackWendy_DownFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "BlackWendy_Standup.frm",
        Func    = "BlackWendy_StandupFunc",
    },

    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "BlackWendy_Die.frm",
        Func    = "BlackWendy_DieFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "BlackWendy_Stone.frm",
        Func    = "BlackWendy_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "BlackWendy_Stone.frm",
        Func    = "BlackWendy_IceCurseFunc",
    },
    
    -- Ȧ�����
    {
        ID      = "HOLD",
        Motion  = "BlackWendy_Stone.frm",
        Func    = "BlackWendy_HoldFunc",
    },
}

CallBack =
{
    Land    = "OnBlackWendy_Land",
    Die     = "OnBlackWendy_Die",
    Damage  = "OnBlackWendy_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitBlackWendy( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
	pMonster:RegistReaction( ATTACKTYPE_HOLD, ATTACKDIR_NORMAL,   "HOLD" )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function BlackWendy_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function BlackWendy_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �������� ����
function BlackWendy_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 50 ) then
		pMonster:PlaySound( "999014", 0 )
	elseif( iFrame == 53 ) then 
		pMonster:StartAttack( 6,PAR_BIG_DAMAGE, 0.3, 22, 24, 4)
	elseif( iFrame == 70 ) then
		pMonster:PlaySound( "999014", 0 ) 
	elseif( iFrame == 72 ) then
		pMonster:StartAttack( 6,PAR_FRONTDOWN_LAST, 0.4, 22, 24, 4)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ��������� ����
function BlackWendy_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 22 ) then
		pMonster:PlaySound( "999009", 0 )
	elseif( iFrame == 60 ) then
		pMonster:PlaySound( "999010", 0 )
	elseif( iFrame == 62 ) then
		pMonster:StartAttack( 4,PAR_SMALL_DAMAGE, 0.5, 15, 15, 3)
	elseif( iFrame == 69 ) then
		pMonster:StartAttack( 4,PAR_BIG_DAMAGE, 0.5, 19, 19, 3)
	elseif( iFrame == 75 ) then
		pMonster:StartAttack( 4,PAR_SMALL_DAMAGE, 0.5, 16, 16, 3)
	elseif( iFrame == 105 ) then
		pMonster:PlaySound( "999011", 0 )
		pMonster:EarthQuakeWithRange( 30, 0.06, 0.03, 1.0 )
	elseif( iFrame == 107 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Black_Wendy_Shockwave", 0.35, 0.0 )
		else
			pMonster:AddParticleNoDirection( "Black_Wendy_Shockwave", -0.35, 0.0 )
		end
		
		-- ����Ʈ
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �������� ����
function BlackWendy_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
        pMonster:StartText( "JUMP" )
    elseif( iFrame == 35 ) then
	    pMonster:SkillReadyEffectNoStop( 100, 100, 255, 0.0 )
	elseif( iFrame == 50 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Black_Wendy_Shockwave", 0.4, 0.0 )
		else
			pMonster:AddParticleNoDirection( "Black_Wendy_Shockwave", -0.4, 0.0 )
		end
	elseif( iFrame == 52 ) then
		pMonster:EarthQuake( 30, 0.06, 0.04 )
	elseif( iFrame == 54 ) then
		pMonster:PlaySound( "999015", 0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ������극�� ����
function BlackWendy_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 30 ) then
		pMonster:PlaySound( "999012", 0 )
    elseif( iFrame == 40 ) then
	    pMonster:SkillReadyEffectNoStop( 100, 100, 255, 0.0 )
    elseif( iFrame == 75 ) then
		pMonster:PlaySound( 999013 )
        pMonster:AddDamage( DT_BLACKWENDY_POISONBREATH )
        pMonster:AddParticle( "Black_Wendy_SPECIAL1_01", 0.4, 0.35 )
        pMonster:AddParticle( "Black_Wendy_SPECIAL1_02", 0.4, 0.35 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �������� �� 
function BlackWendy_HighJumpUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �������� ���� 
function BlackWendy_HighJumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �׾���
function BlackWendy_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
        pMonster:PlaySound(999069)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function BlackWendy_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ�
function BlackWendy_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )				
		
		if( pMonster:GetHP() <= 0 ) then
			--pMonster:SetState( "DIE_LANDING" )
			pMonster:EndMonster()
			pMonster:SetFrameLock( true )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
			pMonster:SetState( "DOWN_UP01" )
    end
end

-- �ٿ� ��
function BlackWendy_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �Ͼ��
function BlackWendy_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame < 16 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	elseif( iFrame == 25 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
	end
	
    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end


--  ����Ŀ�� �ɷ���
function BlackWendy_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
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
function BlackWendy_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
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

--  Ȧ�� �ɷ���
function BlackWendy_HoldFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
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
function BlackWendy_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -600, 500, 600, -500 ) == true ) then
        pMonster:ResetDelay()
    end
end

function BlackWendy_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -800, 600, 800, -600 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function BlackWendy_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function BlackWendy_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
			pMonster:TurnToTarget()
            pMonster:SetState( "WALK" )
            pMonster:ResetDelay()
    end
end

function BlackWendy_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 150, 150, -50 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function BlackWendy_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -200, 140, 200, -240 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function BlackWendy_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 50, -500, 400, 500, -450 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function BlackWendy_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    --if( pMonster:CheckTargetInRange( 200, -250, 200, 250, -250 ) == true and pMonster:GetCountValue() >= 3 ) then
	if( pMonster:CheckTargetInRange( 200, -200, 200, 250, -200 ) == true ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function BlackWendy_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -300, 800, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		OnBlackWendy_Jump( iMonsterIndex  )
		pMonster:SetState( "HIGHJUMP_UP" )
		pMonster:ResetDelay()
    end
end

function BlackWendy_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, -80, 150, -1000 ) == true ) then
        pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedY( 0.01 )            
        pMonster:SetState( "HIGHJUMP_UP" )
        pMonster:ResetDelay()
    end
end

function BlackWendy_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -200, 100, 200, -140 ) == true ) then
	
		if ( pMonster:FloatRand() < 0.95) then
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WAIT" )
		end
		
		pMonster:ResetDelay()
	end
end

function BlackWendy_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 or pMonster:GetIsContact() == true ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function BlackWendy_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnBlackWendy_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "HIGHJUMP_UP" ) == true or pMonster:CheckState( "HIGHJUMP_DOWN" ) == true ) then
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "HIGHJUMP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 1.0 ) / 2.0 )
		pMonster:SetState( "DOWN_UP_LANDING" )
    end
end

function OnBlackWendy_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "STONECURSE" ) == false ) then
		pMonster:SetState( "DIE" )
	end
end

function OnBlackWendy_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 9.0 ) / 10.0 )
    pMonster:SetSpeedY( ( pMonster:GetSpeedY() * 9.0 ) / 10.0 )
    
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
        if( pMonster:IsSuperArmor() == false ) then
            pMonster:SetNoCheckContact( 5 )
        end
	end
    
    if( pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DOWN_DOWN" ) ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
	end
	
    if( pMonster:CheckPreState( "DOWN_UP01" ) or pMonster:CheckPreState( "DOWN_UP02") or pMonster:CheckState( "DOWN_DOWN" ) ) then
		if( pMonster:CheckState( "DAMAGE_UP" ) or pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.028 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DAMAGE_DOWN" ) ) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.019 )			
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -2.0 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_UP_LANDING" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )			
		end	
	end
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and  pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:GetIsContact() == true and pMonster:FloatRand() < 0.1 ) then
			pMonster:SetSuperArmor(true)
            pMonster:TurnToTarget()
            pMonster:SetState( "ATTACK02" )
		end
    end
end

function OnBlackWendy_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 3.9)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.0)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.8))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end