-- AI_Deterioration_Skeleton.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Deterioration_Skeleton_Wait.frm",
        Func    = "Deterioration_Skeleton_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Deterioration_Skeleton_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "Deterioration_Skeleton_Check_ReleaseTarget",
                DelayFrame          = 550,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "Deterioration_Skeleton_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- ��������
            {
                AICheckFrame        = 25,
                AIFunc              = "Deterioration_Skeleton_Check_Attack01",
                DelayFrame          = 55,
            },
            -- ������
            {
                AICheckFrame        = 75,
                AIFunc              = "Deterioration_Skeleton_Check_Attack02",
                DelayFrame          = 75,
            },  
            -- �����Ǿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Deterioration_Skeleton_Check_Attack03",
                DelayFrame          = 165,
            },            
            -- ��������
            {
                AICheckFrame        = 75,
                AIFunc              = "Deterioration_Skeleton_Check_HighJump",
                DelayFrame          = 75,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 75,
                AIFunc              = "Deterioration_Skeleton_Check_JumpDown",
                DelayFrame          = 75,
            },
            -- �ȱ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Deterioration_Skeleton_Check_Walk",
                DelayFrame          = 55,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Deterioration_Skeleton_Walk.frm",
        Func    = "Deterioration_Skeleton_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Deterioration_Skeleton_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Deterioration_Skeleton_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Deterioration_Skeleton_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- ��������
            {
                AICheckFrame        = 15,
                AIFunc              = "Deterioration_Skeleton_Check_Attack01",
                DelayFrame          = 165,
            },
            -- �����Ǿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Deterioration_Skeleton_Check_Attack03",
                DelayFrame          = 220,
            },
            -- ��������
            {
                AICheckFrame        = 75,
                AIFunc              = "Deterioration_Skeleton_Check_HighJump",
                DelayFrame          = 75,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 75,
                AIFunc              = "Deterioration_Skeleton_Check_JumpDown",
                DelayFrame          = 75,
            },
        }
    },
    
    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Deterioration_Skeleton_Attack01.frm",
        Func    = "Deterioration_Skeleton_Attack01Func",
    },
    
    -- ������
    {
        ID      = "ATTACK02",
        Motion  = "Deterioration_Skeleton_Attack02.frm",
        Func    = "Deterioration_Skeleton_Attack02Func",
    },
    
    -- �����Ǿ�
    {
        ID      = "ATTACK03",
        Motion  = "Deterioration_Skeleton_Attack03.frm",
        Func    = "Deterioration_Skeleton_Attack03Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Deterioration_Skeleton_Jump01.frm",
        Func    = "Deterioration_Skeleton_JumpFunc",
    },
    
    -- ���� ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Deterioration_Skeleton_Jump02.frm",
        Func    = "Deterioration_Skeleton_JumpLandingFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Deterioration_Skeleton_Damage_Up.frm",
        Func    = "Deterioration_Skeleton_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Deterioration_Skeleton_Damage_Middle.frm",
        Func    = "Deterioration_Skeleton_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Deterioration_Skeleton_Damage_Down.frm",
        Func    = "Deterioration_Skeleton_DamageFunc",
    },
    
    -- �ٿ� ��01
    {
        ID      = "DOWN_UP01",
        Motion  = "Deterioration_Skeleton_Down_Up01.frm",
        Func    = "Deterioration_Skeleton_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Deterioration_Skeleton_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Deterioration_Skeleton_Down_Up02.frm",
        Func    = "Deterioration_Skeleton_DownUpFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Deterioration_Skeleton_Down_Up03.frm",
        Func    = "Deterioration_Skeleton_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Deterioration_Skeleton_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �� 
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Deterioration_Skeleton_Down_Middle.frm",
        Func    = "Deterioration_Skeleton_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Deterioration_Skeleton_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �� 
    {
        ID      = "DOWN_DOWN",
        Motion  = "Deterioration_Skeleton_Down_Middle.frm",
        Func    = "Deterioration_Skeleton_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Deterioration_Skeleton_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
     -- �ٿ� ����� 
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Deterioration_Skeleton_Down_Up01.frm",
        Func    = "Deterioration_Skeleton_DownFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Deterioration_Skeleton_Standup.frm",
        Func    = "Deterioration_Skeleton_StandupFunc",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Deterioration_Skeleton_Die01.frm",
        Func    = "Deterioration_Skeleton_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Deterioration_Skeleton_Die02.frm",
        Func    = "Deterioration_Skeleton_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Deterioration_Skeleton_Stone.frm",
        Func    = "Deterioration_Skeleton_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Deterioration_Skeleton_Stone.frm",
        Func    = "Deterioration_Skeleton_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Deterioration_Skeleton_Stone.frm",
		Func	= "Deterioration_Skeleton_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnDeterioration_Skeleton_Land",
    Die     = "OnDeterioration_Skeleton_Die",
    Damage  = "OnDeterioration_Skeleton_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitDeterioration_Skeleton( iMonsterIndex )
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
function Deterioration_Skeleton_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �ȱ� ����
function Deterioration_Skeleton_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame < 16 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
	elseif( iFrame >= 31 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
	end
		
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end

end

--  �������� ����
function Deterioration_Skeleton_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame < 31 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
	elseif( iFrame == 31 ) then
		pMonster:PlaySound(432)
		pMonster:AddDamage( DT_D_SKELETON_ATK1_1 )
		--pMonster:AddDamageWithLocate( DT_MONSTER_ABORIGINEMON01_02, 0.1, -0.1 )
	elseif( iFrame >= 41 and iFrame < 61 ) then		
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
	elseif( iFrame == 61 ) then
		pMonster:PlaySound(432)
		pMonster:AddDamage( DT_D_SKELETON_ATK1_2 )
		--pMonster:AddDamageWithLocate( DT_MONSTER_ABORIGINEMON01_02, 0.1, -0.1 )
	elseif( iFrame >= 71 and iFrame < 91 ) then		
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
	elseif( iFrame == 91 ) then
		pMonster:PlaySound(432)
		pMonster:AddDamage( DT_D_SKELETON_ATK1_3 )
		--pMonster:AddDamageWithLocate( DT_MONSTER_ABORIGINEMON01_03, 0.1, -0.1 )
	elseif( iFrame >= 101 and iFrame < 121 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ������ ����
function Deterioration_Skeleton_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 31 ) then
		pMonster:SkillReadyEffectNoStop( 200, 200, 200, 0.0 )	
	elseif( iFrame == 50 ) then
		pMonster:PlaySound(434)
	elseif( iFrame >= 46 and iFrame < 86 ) then
		if( math.mod( iFrame, 5 ) == 0 ) then
			pMonster:AddDamage( DT_D_SKELETON_ATK2_L )
		end
		if( iFrame >= 46 and iFrame < 66 ) then
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		elseif( iFrame >= 66 and iFrame < 86 ) then
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.0 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���ٰ� ����
function Deterioration_Skeleton_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 46 ) then
		pMonster:PlaySound(350)
		pMonster:PlaySound(430)
		pMonster:AddDamageWithAngle( DT_D_SKELETON_ATK3, 0.7 )
		pMonster:AddDamageWithAngle( DT_D_SKELETON_ATK3, 0.5 )
		pMonster:AddDamageWithAngle( DT_D_SKELETON_ATK3, 0.3 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- ���� ����
function Deterioration_Skeleton_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �������� ����
function Deterioration_Skeleton_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �״»���
function Deterioration_Skeleton_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:PlaySound(431)
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Deterioration_Skeleton_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ�
function Deterioration_Skeleton_DownFunc( iMonsterIndex, iFrame )
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

-- �ٿ� ��
function Deterioration_Skeleton_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �Ͼ��
function Deterioration_Skeleton_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame < 16 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	elseif( iFrame == 25 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
	end
	
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )        
    end
end


--  ����Ŀ�� �ɷ���
function Deterioration_Skeleton_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
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
function Deterioration_Skeleton_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
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


-- Ȧ�� �ɷ���(����Ʈ)
function Deterioration_Skeleton_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
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

function Deterioration_Skeleton_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Deterioration_Skeleton_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1100, 900, 1100, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Deterioration_Skeleton_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Deterioration_Skeleton_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Deterioration_Skeleton_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
        pMonster:AddCountValue(1)
		Deterioration_Skeleton_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Deterioration_Skeleton_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

   if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -1000 ) == true ) then
        pMonster:AddCountValue(1)
        pMonster:SetNoCheckContact(30)
        pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedY( 0.01 )            
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Deterioration_Skeleton_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -110, 150, 110, -150 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Deterioration_Skeleton_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -200, 100, 200, -100 ) == true and pMonster:GetCountValue() >= 3 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Deterioration_Skeleton_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -200, 400, 200, 0 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Deterioration_Skeleton_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function Deterioration_Skeleton_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnDeterioration_Skeleton_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "JUMP" ) == true ) then		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "JUMP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 1.0 ) / 2.0 )
		pMonster:SetState( "DOWN_UP_LANDING" )
    end    
end

function OnDeterioration_Skeleton_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetState( "DIE" )
	end	
end

function OnDeterioration_Skeleton_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:AddCountValue(1)
	pMonster:SetPushCheck( true )	
	pMonster:SetSpeedX( (pMonster:GetSpeedX() * 9.0 ) / 10.0 )
    pMonster:SetSpeedY( ( pMonster:GetSpeedY() * 9.0 ) / 10.0 )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
        if( pMonster:IsSuperArmor() == false ) then
            pMonster:SetNoCheckContact( 5 )
        end
	end
    
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
	end
	
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
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
			pMonster:SetState( "DOWN_UP02" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )			
		end	
	end
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.2 and pMonster:GetIsContact() == true and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
			pMonster:TurnToTarget()
			pMonster:AddCountValue(1)
			pMonster:SetState( "ATTACK02" )
		end
    end
end

function Deterioration_Skeleton_Jump( iMonsterIndex )
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

function Deterioration_Skeleton_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.0) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(40)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.042 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.0120)			
		end
	end
end
