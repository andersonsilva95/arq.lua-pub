-- AI_Elizabeth.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Elizabeth_Wait.frm",
        Func    = "Elizabeth_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Elizabeth_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "Elizabeth_Check_ReleaseTarget",
                DelayFrame          = 550,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "Elizabeth_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- ��������
            {
                AICheckFrame        = 110,
                AIFunc              = "Elizabeth_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 400,
                AIFunc              = "Elizabeth_JumpAttack",
                DelayFrame          = 550,
            },
            
            -- �׶��� �극��ũ
            {
                AICheckFrame        = 220,
                AIFunc              = "Elizabeth_Check_Attack04",
                DelayFrame          = 330,
            },
			
			-- �Ѹ�����
            {
                AICheckFrame        = 500,
                AIFunc              = "Elizabeth_Check_Attack05",
                DelayFrame          = 500,
            },
			
            -- �ȱ�
            {
                AICheckFrame        = 75,
                AIFunc              = "Elizabeth_Check_Walk",
                DelayFrame          = 110,
            },            
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "Elizabeth_Check_HighJump",
                DelayFrame          = 55,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Elizabeth_Check_JumpDown",
                DelayFrame          = 55,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Elizabeth_Walk.frm",
        Func    = "Elizabeth_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Elizabeth_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Elizabeth_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Elizabeth_Check_TurnToTarget",
                DelayFrame          = 55,
            },       
            -- ��������
            {
                AICheckFrame        = 75,
                AIFunc              = "Elizabeth_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "Elizabeth_Check_HighJump",
                DelayFrame          = 55,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Elizabeth_Check_JumpDown",
                DelayFrame          = 55,
            },
        }
    },
    
    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Elizabeth_Attack01.frm",
        Func    = "Elizabeth_Attack01Func",
    },
    
    -- ��ġ��
    {
        ID      = "ATTACK02",
        Motion  = "Elizabeth_Attack02.frm",
        Func    = "Elizabeth_Attack02Func",
    },
    
    -- �����
    {
        ID      = "ATTACK04",
        Motion  = "Elizabeth_Attack04.frm",
        Func    = "Elizabeth_Attack04Func",
    },
	
	-- �Ѹ�����
    {
        ID      = "ATTACK05",
        Motion  = "Elizabeth_Attack05.frm",
        Func    = "Elizabeth_Attack05Func",
    },
    
    -- ��������
    {
        ID      = "JUMPATTACK",
        Motion  = "Elizabeth_JumpAttack.frm",
        Func    = "Elizabeth_JumpAttackFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Elizabeth_Process_Jump",
                DelayFrame          = 0,
            },
        }
    },
    
    -- ��������_����
    {
        ID      = "JUMPATTACK_LANDING",
        Motion  = "Elizabeth_JumpAttack_Landing.frm",
        Func    = "Elizabeth_JumpAttackLandingFunc",
    },
        
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Elizabeth_Jump.frm",
        Func    = "Elizabeth_JumpFunc",
    },
    
    -- ���� ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Elizabeth_Jump_Landing.frm",
        Func    = "Elizabeth_JumpLandingFunc",
    },
    

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Elizabeth_Damage_Up.frm",
        Func    = "Elizabeth_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Elizabeth_Damage_Middle.frm",
        Func    = "Elizabeth_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Elizabeth_Damage_Down.frm",
        Func    = "Elizabeth_DamageFunc",
    },
    
    -- �ٿ� ��01
    {
        ID      = "DOWN_UP01",
        Motion  = "Elizabeth_Down_Up01.frm",
        Func    = "Elizabeth_DownUp01Func",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Elizabeth_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Elizabeth_Down_Up02.frm",
        Func    = "Elizabeth_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Elizabeth_Down_Up03.frm",
        Func    = "Elizabeth_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Elizabeth_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
     -- �ٿ� ����� 
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Elizabeth_Down_Special.frm",
        Func    = "Elizabeth_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Elizabeth_StandUp.frm",
        Func    = "Elizabeth_StandUpFunc",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Elizabeth_Die.frm",
        Func    = "Elizabeth_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Elizabeth_Die02.frm",
        Func    = "Elizabeth_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- ȸ��
    {
        ID      = "AVOID",
        Motion  = "Elizabeth_Avoid.frm",
        Func    = "Elizabeth_AvoidFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Elizabeth_Check_Attack02",
                DelayFrame          = 0,
            },
        }
    },    
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Elizabeth_Stone.frm",
        Func    = "Elizabeth_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Elizabeth_Stone.frm",
        Func    = "Elizabeth_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Elizabeth_Stone.frm",
		Func	= "Elizabeth_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnElizabeth_Land",
    Die     = "OnElizabeth_Die",
    Damage  = "OnElizabeth_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitElizabeth( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Elizabeth_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

function Elizabeth_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1100, 900, 1100, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end


-- �ȱ� ����
function Elizabeth_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	
	
	if( iFrame >= 16 and iFrame < 35) then
	    pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
	elseif( iFrame >= 35 and iFrame < 54 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
	elseif( iFrame == 54 ) then
		pMonster:SetSpeedX( 0.0 )
	elseif( iFrame >= 70 and iFrame < 89 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
	elseif( iFrame >= 89 and iFrame < 108 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
	elseif( iFrame == 108 ) then
		pMonster:SetSpeedX( 0.0 )
	end
    
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

--  ��������01 ����
function Elizabeth_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= 21 and iFrame < 31 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -0.5 )
	elseif( iFrame == 71 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		pMonster:PlaySound(244)
		pMonster:AddDamage( DT_MONSTER_ELIZABETH01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��ġ�� ����
function Elizabeth_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 70 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -2.0 )
		pMonster:AddDamage( DT_MONSTER_ELIZABETH02 )
	elseif( iFrame >= 71 and iFrame <= 71 ) then	
		--pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -2.5 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  ����� ����
function Elizabeth_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 5 ) then
        pMonster:SkillReadyEffectNoStop( 220, 220, 220, 0.0 )
    elseif( iFrame == 76 ) then
		pMonster:PlaySound( "47" )
		pMonster:AddDamage( DT_MONSTER_ELIZABETH03_01 )
		pMonster:AddDamage( DT_MONSTER_ELIZABETH03_02 )
		pMonster:AddDamage( DT_MONSTER_ELIZABETH03_03 )
		pMonster:AddDamage( DT_MONSTER_ELIZABETH03_04 )
		pMonster:AddDamage( DT_MONSTER_ELIZABETH03_05 )
		pMonster:AddParticle( "Broken_Ground03", 0.5, 0.1 )		
		pMonster:AddParticle( "Broken_Ground04", 0.5, 0.1 )		
		pMonster:EarthQuake( 20, 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �Ѹ����� ����
function Elizabeth_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 41 ) then
        pMonster:SkillReadyEffectNoStop( 220, 220, 220, 0.0 )
	elseif( iFrame >= 71 and iFrame < 81 ) then				
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 4.0 )
		
		if( iFrame == 71 ) then		
			pMonster:AddDamage( DT_MONSTER_ELIZABETH02 )	
		elseif( iFrame == 76 ) then
			pMonster:AddDamage( DT_MONSTER_ELIZABETH02 )	
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���� ����
function Elizabeth_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �������� ����
function Elizabeth_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �������� ����
function Elizabeth_JumpAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 30 ) then
		pMonster:StartText("JUMP")
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- ������������ ����
function Elizabeth_JumpAttackLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 2 ) then			
        pMonster:EarthQuake( 30, 0.06, 0.01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �״»���
function Elizabeth_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Elizabeth_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ�
function Elizabeth_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE_LANDING" )
        end
    end
end

-- �ٿ�
function Elizabeth_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE" )
        end
    end
end

-- �ٿ� ��
function Elizabeth_DownUp01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function Elizabeth_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
        pMonster:SetSuperArmorFrame( pMonster:GetLastFrame() + 10 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function Elizabeth_DownUp03Func( iMonsterIndex, iFrame )
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

-- �Ͼ��
function Elizabeth_StandUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end

-- ȸ��
function Elizabeth_AvoidFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= 1 and iFrame < 10 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 4.0 )
	elseif( iFrame >= 18 and iFrame < 36 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
	end
	
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
        pMonster:SetInvincible( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
		pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Elizabeth_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Elizabeth_IceCurseFunc( iMonsterIndex, iFrame )
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
function Elizabeth_HoldFunc( iMonsterIndex, iFrame )
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

function Elizabeth_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Elizabeth_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Elizabeth_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -200, 600, 200, -600 ) == false ) then
			pMonster:TurnToTarget()
	        pMonster:SetState( "WALK" )
	        pMonster:ResetDelay()
		end
    end
end

function Elizabeth_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 600, 150, 150 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Elizabeth_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Elizabeth_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

   if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -1000 ) == true ) then
        pMonster:SetNoCheckContact(25)
        pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedY( 0.01 )            
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

--  �������� ����
function Elizabeth_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
        pMonster:SetState( "JUMPATTACK" )
        pMonster:ResetDelay()
    end
end

function Elizabeth_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 150, 150, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Elizabeth_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( iFrame >= (pMonster:GetLastFrame() - 5) and pMonster:CheckTargetInRange( 0, -400, 200, 400, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
    end
end

function Elizabeth_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetCountValue() >= 1 ) then
		pMonster:TurnToTarget()
		pMonster:AddCountValue(-1)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Elizabeth_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 350, -350, 150, 350, -100 ) == true and pMonster:GetCountValue() >= 3) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

function Elizabeth_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function Elizabeth_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

function Elizabeth_Process_Jump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    --pMonster:SetPushCheck( false )

    if( iFrame == 33 ) then
        pMonster:SetNoCheckContact( 62 )

        iTargetX = pMonster:GetTargetX()
        iTargetY = pMonster:GetTargetY()
        iX       = pMonster:GetX()
        iY       = pMonster:GetY()

        pMonster:SetSpeedX( ( iTargetX - iX ) / 80.0 )

        if( iTargetY - iY >= -0.25 ) and ( iTargetY - iY < 0.25 ) then
            pMonster:SetSpeedY( 0.061 )   -- ���� y���� ������ �������� ����..
        elseif( iTargetY - iY >= 0.25 ) and ( iTargetY - iY < 0.5 ) then
            pMonster:SetSpeedY( 0.066 )   -- Ÿ���� ���� �������� ������..
        elseif( iTargetY - iY >= -0.5 ) and ( iTargetY - iY < -0.25 ) then
            pMonster:SetSpeedY( 0.050 )    -- Ÿ���� ���� �������� ������..
        elseif( iTargetY - iY >= 0.5 ) then
            pMonster:SetSpeedY( 0.071 )
        elseif( iTargetY - iY < -0.5 ) then
            pMonster:SetSpeedY( 0.042 )
        end

        pMonster:TurnToTarget()
     elseif( iFrame > 71 ) then
		if( pMonster:GetSpeedY() < 0.1 ) then
			pMonster:SetSpeedY( pMonster:GetSpeedY() - 0.0035 )
		end
     end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnElizabeth_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "JUMP" ) == true ) then		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "JUMP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "JUMPATTACK" ) == true ) then
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 1.0 ) / 2.0 )
		pMonster:SetState( "JUMPATTACK_LANDING" )
    end    
end

function OnElizabeth_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetState( "DIE" )
	end	
end

function OnElizabeth_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetPushCheck( true )	
	pMonster:SetSpeedX( 2.0 * pMonster:GetSpeedX() / 3.0 )
    pMonster:SetSpeedY( 2.0 * pMonster:GetSpeedY() / 3.0 )
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )		
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
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if( pMonster:FloatRand() < 0.04 and pMonster:GetIsContact() == true ) then    
			pMonster:AddCountValue(1)		
			pMonster:SetState( "JUMPATTACK" )
		end
	end
end

function Elizabeth_Jump( iMonsterIndex )
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

function Elizabeth_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
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
