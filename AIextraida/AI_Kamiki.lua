-- AI_Kamiki.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Kamiki_Wait.frm",
        Func    = "Kamiki_WaitFunc",

        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Kamiki_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Kamiki_Check_TurnToTarget",
                DelayFrame          = 55,
            },            

            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "Kamiki_Check_JumpAttack",
                DelayFrame          = 55,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Kamiki_Check_JumpDown",
                DelayFrame          = 55,
            },

            -- ��������
            {
                AICheckFrame        = 33,
                AIFunc              = "Kamiki_Check_Attack01",
                DelayFrame          = 55,
            },
            -- ���Ÿ�����
            {
                AICheckFrame        = 75,
                AIFunc              = "Kamiki_Check_Attack03",
                DelayFrame          = 220,
            },
            -- �ڷ���Ʈ(Ÿ�ٿ��Է�)
            {
                AICheckFrame        = 55,
                AIFunc              = "Kamiki_Check_Teleport",
                DelayFrame          = 220,
            },

            -- ���Ӽ���ų (���۾Ƹ�)
            {
                AICheckFrame        = 220,
                AIFunc              = "Kamiki_Check_Attack04",
                DelayFrame          = 330,
            },

			-- �ظ��ȯ
            {
                AICheckFrame        = 165,
                AIFunc              = "Kamiki_Check_Attack09",
                DelayFrame          = 2200,
            },

            -- �ȱ�
            {
                AICheckFrame        = 35,
                AIFunc              = "Kamiki_Check_Walk",
                DelayFrame          = 75,
            },

        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Kamiki_Walk.frm",
        Func    = "Kamiki_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Kamiki_MoveFail",

        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Kamiki_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "Kamiki_Check_TurnToTarget",
                DelayFrame          = 0,
            },
            -- �޸���
            {
                AICheckFrame        = 25,
                AIFunc              = "Kamiki_Check_Run",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "Kamiki_Check_JumpAttack",
                DelayFrame          = 55,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Kamiki_Check_JumpDown",
                DelayFrame          = 55,
            },
            -- ��������
            {
                AICheckFrame        = 45,
                AIFunc              = "Kamiki_Check_Attack01",
                DelayFrame          = 110,
            },
            -- �ڷ���Ʈ
            {
                AICheckFrame        = 55,
                AIFunc              = "Kamiki_Check_Teleport",
                DelayFrame          = 75,
            },
        }
    },
    
    --  �޸���
    {
        ID      = "RUN",
        Motion  = "Kamiki_Run.frm",
        Func    = "Kamiki_RunFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Kamiki_MoveFail",


        Trigger =
        {
            -- ��������
            {
                AICheckFrame        = 1,
                AIFunc              = "Kamiki_Check_Attack01",
                DelayFrame          = 1,
            },
            -- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "Kamiki_Check_RunStop",
                DelayFrame          = 55,
            },
        }
    },

    -- �ڷ���Ʈ
    {
        ID      = "TELEPORT",
        Motion  = "Kamiki_Avoid.frm",
        Func    = "Kamiki_TeleportFunc",
        
        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 20,
                AIFunc              = "Kamiki_Check_TeleportLanding",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ڷ���Ʈ ����
    {
        ID      = "TELEPORT_LANDING",
        Motion  = "Kamiki_Teleport_Landing.frm",
        Func    = "Kamiki_TeleportLandingFunc",
    },
    
    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Kamiki_Attack01.frm",
        Func    = "Kamiki_Attack01Func",
    },
    
    -- ���Ÿ�����
    {
        ID      = "ATTACK03",
        Motion  = "Kamiki_Attack03.frm",
        Func    = "Kamiki_Attack03Func",
    },
    
    -- ���Ӽ���ų(���۾Ƹ�)
    {
        ID      = "ATTACK04",
        Motion  = "Kamiki_Attack04.frm",
        Func    = "Kamiki_Attack04Func",
    },
    
    -- ����Ӽ���ų(���� �ҿ�����Ʈ)
    {
        ID      = "ATTACK05",
        Motion  = "Kamiki_Attack05.frm",
        Func    = "Kamiki_Attack05Func",
    },
    
    -- �ҼӼ���ų(�������̾����)
    {
        ID      = "ATTACK06",
        Motion  = "Kamiki_Attack06.frm",
        Func    = "Kamiki_Attack06Func",
    },
    
    -- �����Ӽ���ų(���̽��ʵ�)
    {
        ID      = "ATTACK07",
        Motion  = "Kamiki_Attack04.frm",
        Func    = "Kamiki_Attack07Func",
    },
    
    -- �����Ӽ���ų(����Ʈ���ʵ�)
    {
        ID      = "ATTACK08",
        Motion  = "Kamiki_Attack08.frm",
        Func    = "Kamiki_Attack08Func",
    },
	
	-- �ظ��ȯ
    {
        ID      = "ATTACK09",
        Motion  = "Kamiki_Attack09.frm",
        Func    = "Kamiki_Attack09Func",
    },

    -- ����
    {
        ID      = "JUMP",
        Motion  = "Kamiki_Jump.frm",
        Func    = "Kamiki_JumpFunc",
    },

    -- ��������
    {
        ID      = "JUMPATTACK",
        Motion  = "Kamiki_JumpAttack.frm",
        Func    = "Kamiki_JumpAttackFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Kamiki_Damage_Up.frm",
        Func    = "Kamiki_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Kamiki_Damage_Middle.frm",
        Func    = "Kamiki_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Kamiki_Damage_Down.frm",
        Func    = "Kamiki_DamageFunc",
    },
    
    -- �ٿ� ��
    {
        ID                  = "DOWN_UP01",
        Motion              = "Kamiki_Down_Up01.frm",
        Func                = "Kamiki_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Kamiki_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID                  = "DOWN_UP02",
        Motion              = "Kamiki_Down_Up02.frm",
        Func                = "Kamiki_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID                  = "DOWN_UP_LANDING",
        Motion              = "Kamiki_Down_Up03.frm",
        Func                = "Kamiki_DownUp03Func",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Kamiki_CheckStandup",
                DelayFrame          = 0,
            },
            {
                AICheckFrame        = 1,
                AIFunc              = "Kamiki_CheckStandup2",
                DelayFrame          = 5500,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID                  = "DOWN_MIDDLE",
        Motion              = "Kamiki_Down_Down.frm",
        Func                = "Kamiki_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Kamiki_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID                  = "DOWN_DOWN",
        Motion              = "Kamiki_Down_Down.frm",
        Func                = "Kamiki_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Kamiki_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID                  = "DOWN_SPECIAL",
        Motion              = "Kamiki_Down_Special01.frm",
        Func                = "Kamiki_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID                  = "DOWN_SPECIAL_LANDING",
        Motion              = "Kamiki_Down_Special02.frm",
        Func                = "Kamiki_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Kamiki_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Kamiki_Die01.frm",
        Func    = "Kamiki_DieFunc",
    },
    
    -- �ױ�02
    {
        ID      = "DIE_LANDING",
        Motion  = "Kamiki_Die02.frm",
        Func    = "Kamiki_DieLandingFunc",
    },
    
    -- ȸ�ǰ���
    {
        ID      = "AVOIDATTACK",
        Motion  = "Kamiki_AvoidAttack.frm",
        Func    = "Kamiki_AvoidAttackFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Kamiki_Stone.frm",
        Func    = "Kamiki_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Kamiki_Stone.frm",
        Func    = "Kamiki_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Kamiki_Stone.frm",
		Func	= "Kamiki_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnKamiki_Land",
    Die     = "OnKamiki_Die",
    Damage  = "OnKamiki_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitKamiki( iMonsterIndex )
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
	
	pMonster:RegisterSummonMonsterType( MON_BLACKANTMON )
	pMonster:SetCountValue( 0 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Kamiki_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

	if( pMonster:GetCountValue() == 0 ) then
		pMonster:AddParticle("Iblis_Summon_01", 0, 0)
		pMonster:AddParticle("Iblis_Summon_02", 0, 0)
		pMonster:AddParticle("Iblis_Summon_03", 0, 0)
		pMonster:AddParticle("Iblis_Summon_04", 0, 0)
		pMonster:AddParticle("Iblis_Summon_05", 0, 0)

		pMonster:SetCountValue( 1 )
	end
end

-- �ȱ� ����
function Kamiki_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �޸��� ����
function Kamiki_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

-- �ױ�01
function Kamiki_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LANDING" )
    end
end

-- �ױ�02
function Kamiki_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Kamiki_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function Kamiki_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if (iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function Kamiki_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function Kamiki_DownUp03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 5 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )

        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetSuperArmor( false )
            pMonster:SetState( "DIE_LANDING" )
        end
    end
end

-- �ٿ� �ٿ�
function Kamiki_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )

        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetSuperArmor( false )
            pMonster:SetState( "DIE_LANDING" )
        end
    end
end

-- �ٿ� �����
function Kamiki_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if (iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function Kamiki_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetSuperArmor( false )
            pMonster:SetState( "DIE_LANDING" )
        end
    end
end

--  �������� ����
function Kamiki_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 36 ) then
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.8 )
    elseif( iFrame == 37 ) then
		pMonster:PlaySound( "3" )
        pMonster:AddDamageWithLocate( DT_MONSTER_KAMIKI09 )
    elseif( iFrame == 43 ) then
        pMonster:PlaySound( "3" )
        pMonster:AddDamageWithLocate( DT_MONSTER_KAMIKI10 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���Ÿ����� ����
function Kamiki_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 51 ) then
        pMonster:AddParticle("special02_1_2", 0.13, 0.27)
        pMonster:AddParticle("special02_1_3", 0.13, 0.27)
    elseif( iFrame == 91 ) then
        pMonster:PlaySound( "2" )
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.5 )
        pMonster:AddDamage( DT_MONSTER_KAMIKI08 )
    elseif( iFrame == 114 ) then
        pMonster:PlaySound( "2" )
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.5 )
        pMonster:AddDamage( DT_MONSTER_KAMIKI08 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
    end

end

--  ���Ӽ���ų(���۾Ƹ�) ����
function Kamiki_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 40 ) then
        pMonster:AddParticle("KamikiCircleYellow", 0.00, 0.27)
    elseif( iFrame == 42 ) then
        pMonster:SkillReadyEffect(200,200,100,0.2)
    elseif( iFrame == 73 ) then
        pMonster:AddParticle("Kamiki_SPECIAL6_01", 0.0, 0.27)
        pMonster:AddParticle("Kamiki_SPECIAL6_02", 0.0, 0.27)
        pMonster:AddParticle("Kamiki_SPECIAL6_03", 0.0, 0.27)
        pMonster:AddParticle("Kamiki_SPECIAL6_04", 0.0, 0.27)
		pMonster:PlaySound(995015)
        --pMonster:SetSuperArmorFrame( 750 )
	elseif( iFrame == 81 ) then
		pMonster:AddDamage( DT_MONSTER_KAMIKI06 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ӽ���ų(����Į����) ����
function Kamiki_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 36 ) then
        pMonster:AddParticle("KamikiCircleBlack", 0.00, 0.27)
    elseif( iFrame == 37 ) then
        pMonster:SkillReadyEffect(100,100,100)
    elseif( iFrame == 71 ) then
        pMonster:SetFly( true ) 
        pMonster:SetNoCheckContact( 55 )
        pMonster:SetSpeedX( 0.0 )
        pMonster:SetSpeedY( 0.002 )

        pMonster:AddParticle("Kamiki_SPECIAL7_01", 0.0, 0.3)
        pMonster:AddParticle("Kamiki_SPECIAL7_02", 0.0, 0.3)
        pMonster:AddParticle("Kamiki_SPECIAL7_03", 0.0, 0.3)
        pMonster:AddParticle("Kamiki_SPECIAL7_04", 0.0, 0.3)
        pMonster:AddParticle("Kamiki_SPECIAL7_05", 0.0, 0.3)
        pMonster:AddParticle("Kamiki_SPECIAL7_06", 0.0, 0.3)
		pMonster:PlaySound(995028)
    --elseif( iFrame == 76 ) then						-- 100722 ���� ����
    --    pMonster:AddDamage( DT_MONSTER_KAMIKI06 )

    elseif( iFrame == 80 ) then
        local iCount = 8
        local fAngle = 3.14 * 2 / iCount
        local i = 0

        while ( i < iCount ) do
            pMonster:AddDamageWithAngle( DT_FIREBALL_DARK, fAngle * i )
            i = i + 1
        end

    elseif( iFrame == 110 ) then
        pMonster:SetFly( false ) 
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
    end
end

--  �ҼӼ���ų(�������̾����) ����
function Kamiki_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 34 ) then
        pMonster:AddParticle("KamikiCircleRed", 0.00, 0.27)
    elseif( iFrame == 35 ) then
        pMonster:SkillReadyEffect(200,50,50,0.2)
    elseif( iFrame == 68 ) then
		pMonster:PlaySound(995027)
        pMonster:AddDamage( DT_MONSTER_KAMIKI01 )
        --pMonster:AddDamage( DT_MONSTER_KAMIKI02 )
        pMonster:AddDamage( DT_MONSTER_KAMIKI03 )
        --pMonster:AddDamage( DT_MONSTER_KAMIKI04 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
    end
end

--  �����Ӽ���ų(���̽��ʵ�) ����
function Kamiki_Attack07Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 40 ) then
        pMonster:AddParticle("KamikiCircleIce", 0.00, 0.27)
    elseif( iFrame == 41 ) then
        pMonster:SkillReadyEffect(80,100,200,0.2)
    elseif( iFrame == 81 ) then
        pMonster:AddParticle("Kamiki_SPECIAL4_01", 0.00, 0.36)
        pMonster:AddParticle("Kamiki_SPECIAL4_02", 0.00, 0.36)
        pMonster:AddParticle("Kamiki_SPECIAL4_03", 0.00, 0.36)
        pMonster:AddParticle("Kamiki_SPECIAL4_04", 0.00, 0.36)
        pMonster:AddParticle("Kamiki_SPECIAL4_05", 0.00, 0.36)
        pMonster:AddParticle("Kamiki_SPECIAL4_06", 0.00, 0.36)
        pMonster:AddParticle("Kamiki_SPECIAL4_07", 0.00, 0.36)
		pMonster:PlaySound(995027)
        pMonster:AddDamage( DT_MONSTER_KAMIKI05 )
	elseif( iFrame == 111 ) then
		pMonster:PlaySound(995027)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
    end
end

--  �����Ӽ���ų(����Ʈ�� ����) ����
function Kamiki_Attack08Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 42 ) then
        pMonster:AddParticle("KamikiCircleBlue", 0.00, 0.27)
    elseif( iFrame == 43 ) then
        pMonster:SkillReadyEffect(60,60,255,0.2)
    elseif( iFrame == 44 ) then
        pMonster:KamikiLightningReady( pMonster:GetX() + 0.3, pMonster:GetY() )
        pMonster:KamikiLightningReady( pMonster:GetX() - 0.3, pMonster:GetY() )
        pMonster:KamikiLightningReady( pMonster:GetX() + 0.9, pMonster:GetY() )
        pMonster:KamikiLightningReady( pMonster:GetX() - 0.9, pMonster:GetY() )
        pMonster:KamikiLightningReady( pMonster:GetX() + 1.5, pMonster:GetY() )
        pMonster:KamikiLightningReady( pMonster:GetX() - 1.5, pMonster:GetY() )
        pMonster:KamikiLightningReady( pMonster:GetX() + 2.1, pMonster:GetY() )
        pMonster:KamikiLightningReady( pMonster:GetX() - 2.1, pMonster:GetY() )
        pMonster:KamikiLightningReady( pMonster:GetX() + 2.7, pMonster:GetY() )
        pMonster:KamikiLightningReady( pMonster:GetX() - 2.7, pMonster:GetY() )
        
    elseif( iFrame == 70 ) then
        pMonster:KamikiLightning( pMonster:GetX() + 0.3, pMonster:GetY() )
        pMonster:KamikiLightning( pMonster:GetX() - 0.3, pMonster:GetY() )
    elseif( iFrame == 75 ) then
        pMonster:KamikiLightning( pMonster:GetX() + 0.9, pMonster:GetY() )
        pMonster:KamikiLightning( pMonster:GetX() - 0.9, pMonster:GetY() )
    elseif( iFrame == 80 ) then
        pMonster:KamikiLightning( pMonster:GetX() + 1.5, pMonster:GetY() )
        pMonster:KamikiLightning( pMonster:GetX() - 1.5, pMonster:GetY() )
    elseif( iFrame == 85 ) then
        pMonster:KamikiLightning( pMonster:GetX() + 2.1, pMonster:GetY() )
        pMonster:KamikiLightning( pMonster:GetX() - 2.1, pMonster:GetY() )
    elseif( iFrame == 90 ) then
        pMonster:KamikiLightning( pMonster:GetX() + 2.7, pMonster:GetY() )
        pMonster:KamikiLightning( pMonster:GetX() - 2.7, pMonster:GetY() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
    end
end

--  �ظ��ȯ ����
function Kamiki_Attack09Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 81 ) then
		local posy = 0.0
		pMonster:AddParticle("Iblis_Summon_01", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_02", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_03", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_04", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_05", 0.0, posy)
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_BLACKANTMON
        pMon.fX = -200
        pMon.fY = 200
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_BLACKANTMON
        pMon.fX = -100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_BLACKANTMON
        pMon.fX = 100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_BLACKANTMON
        pMon.fX = 200
        pMon.fY = 200
        pMonster:SummonMonster( pMon )
		pMonster:PlaySound(996004)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function Kamiki_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "JUMP" )
    end

end

--  �������� ����
function Kamiki_JumpAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 38 ) then
        pMonster:StartAttack( 15, PAR_DOWN, 0.0 )
    elseif( iFrame == 48 ) then
        pMonster:EndAttack()
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  �ڷ���Ʈ ����
function Kamiki_TeleportFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:ToggleRender( false )
        pMonster:SetPushCheck( false )
        pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 10 )
        pMonster:AddParticle( "warp01", 0.0, -0.3 )
		pMonster:AddParticle( "warp02", 0.0, -0.3 )
        pMonster:PlaySound( "486" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )                
    end
end

--  �ڷ���Ʈ ���� ����
function Kamiki_TeleportLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:AddParticle( "warp01", 0.0, -0.3 )
		pMonster:AddParticle( "warp02", 0.0, -0.3 )
        pMonster:PlaySound( "486" )
    elseif( iFrame == 6 ) then        
        pMonster:ToggleRender( true )
        pMonster:SetPushCheck( true )
    elseif( iFrame == 10 ) then		
		pMonster:SetInvincible( false )	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        if( pMonster:GetCountValue() == 1 ) then
            pMonster:SetState( "ATTACK01" )   -- ��������        
        elseif( pMonster:GetCountValue() == 2 ) then
            pMonster:SetState( "ATTACK05" )   -- ����Ӽ���ų(����Į����)
        elseif( pMonster:GetCountValue() == 3 ) then
            pMonster:SetState( "ATTACK06" )   -- �ҼӼ���ų(�������̾����)
        elseif( pMonster:GetCountValue() == 4 ) then
            pMonster:SetState( "ATTACK07" )   -- �����Ӽ���ų(���̽� �ʵ�)
        elseif( pMonster:GetCountValue() == 5 ) then
            pMonster:SetState( "ATTACK08" )   -- �����Ӽ���ų(����Ʈ�� ����)
        else
            pMonster:SetState( "WAIT" )   -- �����ֱ�
        end
        
        --�׽�Ʈ��
        --pMonster:SetState( "ATTACK04" )   -- ���Ӽ���ų (���۾Ƹ�)
        --pMonster:SetState( "ATTACK05" )   -- ����Ӽ���ų(����Į����)
        --pMonster:SetState( "ATTACK06" )   -- �ҼӼ���ų(�������̾����)
        --pMonster:SetState( "ATTACK07" )   -- �����Ӽ���ų(���̽� �ʵ�)
        --pMonster:SetState( "ATTACK08" )   -- �����Ӽ���ų(����Ʈ�� ����)
    end
end

--  ȸ�ǰ��� ����
function Kamiki_AvoidAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:SetFly(true) 
        pMonster:SetNoCheckContact( 15 )
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -3.0 )
        pMonster:SetSpeedY( 0.004 )
    elseif( iFrame == 36 ) then    
        pMonster:SetFly(false) 
        pMonster:SetSuperArmor( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Kamiki_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Kamiki_IceCurseFunc( iMonsterIndex, iFrame )
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
function Kamiki_HoldFunc( iMonsterIndex, iFrame )
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

function Kamiki_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Kamiki_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
        pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function Kamiki_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true ) then
        pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Kamiki_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -200, 100, 200, -100 ) == true ) then
        pMonster:TurnToTarget()
        pMonster:SetState( "RUN" )
        pMonster:ResetDelay()
    end
end

function Kamiki_Check_RunStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 320, -300, 800, 300, -800 ) == false ) then
        pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
end

function Kamiki_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function Kamiki_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 70, -80, 100, 80, -100 ) == true ) then
        pMonster:SetState( "ATTACK01" )
        pMonster:ResetDelay()
    end
end

function Kamiki_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -100, 100, 100, -140 ) == true ) then
        pMonster:SetState( "ATTACK03" )
        pMonster:ResetDelay()
    end
end

function Kamiki_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		if ( pMonster:FloatRand() < 0.5 ) then
        	pMonster:SetState( "ATTACK07" )
        	pMonster:ResetDelay()
		end
    end
end

function Kamiki_Check_Attack09( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetSummonedMonsterCount() < 3 ) then
        pMonster:SetState( "ATTACK09" )
        pMonster:ResetDelay()
    end
end

function Kamiki_Check_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 600, 100, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
        Kamiki_Jump( iMonsterIndex )
        pMonster:SetState( "JUMPATTACK" )
        pMonster:ResetDelay()
    end
end

function Kamiki_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -600 ) == true ) then
        pMonster:SetNoCheckContact(30)
        pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedY( 0.01 )            
        pMonster:SetState( "JUMP" )
        pMonster:ResetDelay()
    end
end

function Kamiki_Check_Teleport( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 200, -300, 130, 300, -130 ) == false ) then
        local fRand = pMonster:FloatRand()
        local fDistX = 0.2

        if ( fRand < 0.2 ) then
            pMonster:SetCountValue( 1 )
            fDistX = 0.2
        elseif ( fRand < 0.4 ) then
            pMonster:SetCountValue( 2 )
            fDistX = 0.2
        elseif ( fRand < 0.6 ) then
            pMonster:SetCountValue( 3 )
            fDistX = 0.6
        elseif ( fRand < 0.8 ) then
            pMonster:SetCountValue( 4 )
            fDistX = 0.2
        else
            pMonster:SetCountValue( 5 )
            fDistX = 0.6
        end

        if( pMonster:GetTargetIsRight() == true ) then
            pMonster:SetX( pMonster:GetTargetX() - fDistX )
        else
            pMonster:SetX( pMonster:GetTargetX() + fDistX )
        end

        pMonster:SetY( pMonster:GetTargetY() + 0.1 )
        pMonster:SetState( "TELEPORT" )
		pMonster:ToggleRender( false )
        pMonster:ResetDelay()
    end
end

function Kamiki_Check_TeleportLanding( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
        pMonster:TurnToTarget()
    end
    
    pMonster:SetState( "TELEPORT_LANDING" )
    pMonster:ResetDelay()    
end

function Kamiki_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
        local fRand = pMonster:FloatRand()
        if ( fRand < 0.2 ) then
            pMonster:SetCountValue( 1 )
        elseif ( fRand < 0.4 ) then
            pMonster:SetCountValue( 2 )
        elseif ( fRand < 0.6 ) then
            pMonster:SetCountValue( 3 )
        elseif ( fRand < 0.8 ) then
            pMonster:SetCountValue( 4 )
        else
            pMonster:SetCountValue( 5 )
        end
        
        if( pMonster:GetTargetIsRight() == true ) then
            pMonster:SetX( pMonster:GetTargetX() - 0.2 )
        else
            pMonster:SetX( pMonster:GetTargetX() + 0.2 )
        end
        pMonster:SetY( pMonster:GetTargetY() + 0.1 )
        pMonster:SetState( "TELEPORT" )
		pMonster:ToggleRender( false )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnKamiki_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true ) then
        pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    elseif( pMonster:CheckState( "TELEPORT_LANDING" ) == true ) then
        
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then        
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )        
        pMonster:SetState( "DOWN_UP_LANDING" )    
    elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then        
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )        
        pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end
end

function OnKamiki_Die( iMonsterIndex )
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

function OnKamiki_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetPushCheck( true )
    
    if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )        
    end
    
    if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
        if( pMonster:CheckState( "DAMAGE_UP" ) or pMonster:CheckState( "DOWN_UP01" )) then
            pMonster:SetSpeedY( 0.032 )
            pMonster:SetState( "DOWN_UP01" )        
        elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DAMAGE_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -4.0 )
			pMonster:SetNoCheckContact( 5 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_MIDDLE" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )			
		end	 
    end
    
    if( pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
        if ( pMonster:FloatRand() < 0.2 and pMonster:GetIsContact() == true and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
            pMonster:SetSpeedX( 0.0 )
			local fRand = pMonster:FloatRand()
			local fDistX = 0.2
			
            if ( fRand < 0.2 ) then            
				fDistX = 0.2
                if( pMonster:GetTargetIsRight() == true ) then
                    pMonster:SetX( pMonster:GetTargetX() - fDistX )
                else
                    pMonster:SetX( pMonster:GetTargetX() + fDistX )
                end
                
                pMonster:SetCountValue( 1 )
                
            elseif ( fRand < 0.4 ) then            
				fDistX = 0.3
                if( pMonster:GetTargetIsRight() == true ) then
                    pMonster:SetX( pMonster:GetTargetX() - fDistX )
                else
                    pMonster:SetX( pMonster:GetTargetX() + fDistX )
                end
                
                pMonster:SetCountValue( 2 )
                
            elseif ( fRand < 0.6 ) then      
				fDistX = 0.7
                if( pMonster:GetTargetIsRight() == true ) then
                    pMonster:SetX( pMonster:GetTargetX() - fDistX )
                else                                     
                    pMonster:SetX( pMonster:GetTargetX() + fDistX )
                end                                   
                
                pMonster:SetCountValue( 3 )        
            elseif ( fRand < 0.8 ) then                        
				fDistX = 0.2
                if( pMonster:GetTargetIsRight() == true ) then
                    pMonster:SetX( pMonster:GetTargetX() - fDistX )
                else                                     
                    pMonster:SetX( pMonster:GetTargetX() + fDistX )
                end                                   
                
                pMonster:SetCountValue( 4 )        
            elseif ( fRand < 1.0 ) then                        
				fDistX = 0.7
                if( pMonster:GetTargetIsRight() == true ) then
                    pMonster:SetX( pMonster:GetTargetX() - fDistX )
                else                                     
                    pMonster:SetX( pMonster:GetTargetX() + fDistX )
                end                                   
                
                pMonster:SetCountValue( 5 )        
            end
            
            pMonster:SetY( pMonster:GetTargetY() + 0.1 )    
            pMonster:SetState( "TELEPORT" )
        else
            pMonster:SetNoCheckContact( 0 )
            --pMonster:SetSpeedY( 0.0 )
        end
    end
end

function Kamiki_Jump( iMonsterIndex )
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

function Kamiki_MoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetIsContact() == true )then        
        if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then            
            pMonster:SetNoCheckContact(27)
            pMonster:SetState( "JUMP" )            
            pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.3 )            
            pMonster:SetSpeedY( 0.035 )            
        else
            pMonster:SetNoCheckContact(30)
            pMonster:SetIgnoreFHCheck(true)
            pMonster:SetState( "JUMP" )        
            pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
            pMonster:SetSpeedY( 0.019 )            
        end
    end
end
