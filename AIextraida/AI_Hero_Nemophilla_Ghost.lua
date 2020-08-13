-- AI_nemophila.lua

PHASESHIFT_HP = 0.8
sheild_check = false

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "nemophila_Wait.frm",
        Func    = "nemophilaGhost_WaitFunc",

        Trigger =
        {
			-- ���� ������ üũ
            {
                AICheckFrame        = 1,
                AIFunc              = "nemophilaGhost_Check_shield",
                DelayFrame          = 1,
            },
            
			-- Ÿ����
            {
                AICheckFrame        = 50,
                AIFunc              = "nemophilaGhost_Check_Targeting",
                DelayFrame          = 50,
            },

            -- Ÿ������ (�ϴ� ����)
            --{
            --    AICheckFrame        = 220,
            --    AIFunc              = "nemophilaGhost_Check_ReleaseTarget",
            --    DelayFrame          = 440,
            --},

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 30,
                AIFunc              = "nemophilaGhost_Check_TurnToTarget",
                DelayFrame          = 30,
            },

            -- �Ǹ��� ���� [75%]
            {
                AICheckFrame        = 200,
                AIFunc              = "nemophilaGhost_Check_Attack01",
                DelayFrame          = 800,
				DelayFrame1			= 650,
				DelayFrame2			= 550,
            },

            -- ��ȥ ����
            {
                AICheckFrame        = 200,
                AIFunc              = "nemophila_Check_Attack02",
                DelayFrame          = 550,
				DelayFrame1			= 350,
				DelayFrame2			= 250,
            },

			{
                AICheckFrame        = 30,
                AIFunc              = "nemophilaGhost_Check_Attack03",
                DelayFrame          = 75,
            },

            -- �絵 ��ȯ
            {
                AICheckFrame        = 512,
                AIFunc              = "nemophilaGhost_Check_Attack04",
                DelayFrame          = 444,
            },
            

			-- ������ ��
            {
                AICheckFrame        = 100,
				AICheckFrame1       = 100,
				AICheckFrame2       = 100,
                AIFunc              = "nemophilaGhost_Check_Attack06",
                DelayFrame          = 150,
				DelayFrame1			= 100,
				DelayFrame2			= 100,
            },
            
			-- ��ũ �õ�
            {
                AICheckFrame        = 45,
                AIFunc              = "nemophilaGhost_Check_Attack11",
                DelayFrame          = 50,
            },
			
			-- ����� ����
            {
                AICheckFrame        = 75,
                AIFunc              = "nemophila_Check_Attack09",
				DelayFrame          = 110,
				DelayFrame1			= 110,
				DelayFrame2			= 110,
            },

            -- �ڷ���Ʈ(Ÿ�ٿ��Է�)
            {
                AICheckFrame        = 144,
                AIFunc              = "nemophilaGhost_Check_Teleport",
                DelayFrame          = 333,
            },

            -- �ڷ���Ʈ(Ÿ�ٿ��� ����ġ��)
            {
                AICheckFrame        = 55,
                AIFunc              = "nemophilaGhost_Check_Teleport2",
                DelayFrame          = 75,
            },

        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "nemophila_wait.frm",
        Func    = "nemophilaGhost_WalkFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 30,
                AIFunc              = "nemophilaGhost_Check_Targeting",
                DelayFrame          = 90,
            },

			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "nemophilaGhost_Check_TurnToTarget",
                DelayFrame          = 55,
            },

            -- �ڷ���Ʈ(Ÿ�ٿ��� ����ġ��)
            {
                AICheckFrame        = 55,
                AIFunc              = "nemophilaGhost_Check_Teleport2",
                DelayFrame          = 55,
            },
			
			-- ����� ����
            {
                AICheckFrame        = 75,
                AIFunc              = "nemophila_Check_Attack09",
				DelayFrame          = 110,
				DelayFrame1			= 110,
				DelayFrame2			= 110,
            },
			
			-- ���߱�
            {
                AICheckFrame        = 110,
                AIFunc              = "nemophilaGhost_Check_WalkStop",
                DelayFrame          = 150,
            },

        }
    },
    
    -- �������!(����; ��ũ�ǵ�� �� ����)
    {
        ID      = "SHEILD_BREAK",
        Motion  = "nemophila_Attack11.frm",
        Func    = "nemophilaGhost_breakFunc",
    },
    
    -- �Ǹ��� ����
    {
        ID      = "ATTACK01",
        Motion  = "nemophila_Attack01.frm",
        Func    = "nemophilaGhost_Attack01Func",
    },
    
    -- ��ȥ ����(��Ʈ ����)
    {
        ID      = "ATTACK02",
        Motion  = "nemophila_Attack02.frm",
        Func    = "nemophilaGhost_Attack02Func",
    },
    
    -- ��ȥ�� �Ҳ�1
    {
        ID      = "ATTACK03",
        Motion  = "nemophila_Attack03.frm",
        Func    = "nemophilaGhost_Attack03Func",
    },
    
    -- ��ȥ�� �Ҳ�2
    {
        ID      = "ATTACK04",
        Motion  = "nemophila_Attack03.frm",
        Func    = "nemophilaGhost_Attack04Func",
    },
    
    -- ��ȥ�� �Ҳ�3
    {
        ID      = "ATTACK05",
        Motion  = "nemophila_Attack03.frm",
        Func    = "nemophilaGhost_Attack05Func",
    },

    -- ��ȥ�� �Ҳ� ��� ��
    {
        ID      = "ATTACK03_ING",
        Motion  = "nemophila_Attack04.frm",
        Func    = "nemophilaGhost_Attack03_ingFunc",
    },

    -- ��ȥ�� �Ҳ� ��
    {
        ID      = "ATTACK03_END",
        Motion  = "nemophila_Attack05.frm",
        Func    = "nemophilaGhost_Attack03_endFunc",
    },

    -- ������ ��
    {
        ID      = "ATTACK06",
        Motion  = "nemophila_Attack06.frm",
        Func    = "nemophilaGhost_Attack06Func",
    },


    -- ����� ����
    {
        ID      = "ATTACK09",
        Motion  = "nemophila_Attack09.frm",
        Func    = "nemophilaGhost_Attack09Func",
    },

    -- ������ ��Ʈ ��ȯ(�׷��� ��ũ�õ�� �Ǿ� ����;)
    {
        ID      = "ATTACK10",
        Motion  = "nemophila_Attack10.frm",
        Func    = "nemophilaGhost_Attack10Func",
    },

    -- ��ũ�õ�
    {
        ID      = "ATTACK11",
        Motion  = "nemophila_Attack11.frm",
        Func    = "nemophilaGhost_Attack11Func",
    },
    
    -- ������ ��ȯ(������ ��Ʈ ��ȯ)
    {
        ID      = "ATTACK12",
        Motion  = "nemophila_Attack12.frm",
        Func    = "nemophilaGhost_Attack12Func",
    },
    
    -- �Ǹ��� ����
    {
        ID      = "ATTACK13",
        Motion  = "nemophila_Attack13.frm",
        Func    = "nemophilaGhost_Attack13Func",
    },

    -- �����ھ� ī��Ʈ..
    {
        ID      = "COUNTER",
        Motion  = "nemophila_down01.frm",
        Func    = "nemophilaGhost_CounterFunc",
    },
    
    -- ������ ��
    {
        ID      = "COUNTER_DOWN",
        Motion  = "nemophila_down02.frm",
        Func    = "nemophilaGhost_CounterDownFunc",
    },
    
    -- ������ ��
    {
        ID      = "STANDUP",
        Motion  = "nemophila_standup.frm",
        Func    = "nemophilaGhost_StandupFunc",
    },

    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "nemophila_die.frm",
        Func    = "nemophilaGhost_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ڷ���Ʈ
    {
        ID      = "TELEPORT",
        Motion  = "nemophila_attack07_A.frm",
        Func    = "nemophilaGhost_TeleportFunc",
        
        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 10,
                AIFunc              = "nemophilaGhost_Check_TeleportLanding",
                DelayFrame          = 10,
            },
        }
    },
    
    -- �ڷ���Ʈ
    {
        ID      = "TELEPORT2",
        Motion  = "nemophila_attack07_A.frm",
        Func    = "nemophilaGhost_Teleport2Func",
        
        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 10,
                AIFunc              = "nemophilaGhost_Check_TeleportLanding",
                DelayFrame          = 10,
            },
        }
    },
    
    -- �ڷ���Ʈ ����
    {
        ID      = "TELEPORT_LANDING",
        Motion  = "nemophila_attack07_B.frm",
        Func    = "nemophilaGhost_TeleportLandingFunc",
    },
    
    {
        ID      = "SUMMON",
        Motion  = "nemophila_attack02.frm",
        Func    = "nemophilaGhost_SummonFunc",
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "nemophila_die.frm",
        Func    = "nemophilaGhost_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "OnnemophilaGhost_Land",
    Die     = "OnnemophilaGhost_Die",
    Damage  = "OnnemophilaGhost_Damage",
    SheldDamage= "OnnemophilaGhost_ShieldDamage"
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function Initnemophila( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function nemophilaGhost_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ��� ����
function nemophilaGhost_SummonFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 2 ) then
		local posy = 0.0
		pMonster:AddParticle("nemophilaGhost_Summon_Circle_01", 0.0, posy)
		pMonster:AddParticle("nemophilaGhost_Summon_Circle_02", 0.0, posy)
		pMonster:AddParticle("nemophilaGhost_Summon_Circle_03", 0.0, posy)
		pMonster:AddParticle("nemophilaGhost_Summon_Circle_04", 0.0, posy)
		pMonster:PlaySound(998021)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- ��� ����
function nemophilaGhost_StunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:InitTimer()
		pMonster:StartTimer()
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetTimer() > 275 ) then
			pMonster:SetState( "WAIT" )
			pMonster:InitTimer()
		else
			pMonster:SetFrameLock( true )
		end
    end
end

-- �ȱ� ����
function nemophilaGhost_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �״»���
function nemophilaGhost_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound( "986026" )

	elseif( iFrame == 70 ) then
		pMonster:AddParticleNoDirection( "Nemo_Copy_Die_01", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Copy_Die_02", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Copy_Die_03", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Copy_Die_04", 0, 0.1 )

	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- �״»��� ����
function nemophilaGhost_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )

	elseif( iFrame == 2 ) then
		pMonster:PlaySound(986026)
	elseif( iFrame == 70 ) then
		pMonster:AddParticleNoDirection( "Nemo_Copy_Die_01", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Copy_Die_02", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Copy_Die_03", 0, 0.1 )
		pMonster:AddParticleNoDirection( "Nemo_Copy_Die_04", 0, 0.1 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end



-- ������ ������
function nemophilaGhost_CounterFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 6 ) then
		pMonster:PlaySound( "986033" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "COUNTER_DOWN" )
    end
end

-- ������ ������
local appa = 1
function nemophilaGhost_CounterDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        if( appa >= 3 ) then
			pMonster:SetState( "STANDUP" )
		else
			appa = appa + 1
			pMonster:SetState( "COUNTER_DOWN" )
		end
    end
end

-- ������ ������
function nemophilaGhost_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	appa = 1
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function nemophilaGhost_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 6 ) then
		pMonster:PlaySound( "986017" )
	elseif( iFrame == 50 ) then
		local index = pMonster:GetLastAttackedMe()
		if ( index >= 0 and index < DUNGEON_PLAYER_NUM ) then
			local pPlayer = g_MyD3D:GetPlayer(index)
			if ( pPlayer:IsLocalPlayer() ) then
				pPlayer:AddDamage(DT_HERO_NEMOPHILLA_BLIND)
			end
			pMonster:AddDamageLastPlayers(DT_HERO_NEMOPHILLA_BLIND_SIGN)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ʈ�� ����
function nemophilaGhost_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
		elseif( iFrame == 84 ) then

			if( not pMonster:GetIsRight() ) then
				pMonster:AddParticleNoDirection( "Nemo_Change_Shot_01", -0.2, 0.95 )
				pMonster:AddParticleNoDirection( "Nemo_Change_Shot_02", -0.2, 0.95 )
				pMonster:AddParticleNoDirection( "Nemo_Change_Shot_03", -0.2, 0.95 )
			else
				pMonster:AddParticleNoDirection( "Nemo_Change_Shot_01", 0.2, 0.95 )
				pMonster:AddParticleNoDirection( "Nemo_Change_Shot_02_R", 0.2, 0.95 )
				pMonster:AddParticleNoDirection( "Nemo_Change_Shot_03_R", 0.2, 0.95 )
			end
		
		
			pMonster:AddDamage(DT_HERO_NEMOPHILLA_MIND_STARTER)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��Ÿ ����Ʈ
function nemophilaGhost_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetCountValue(1)
	elseif( iFrame == 15 ) then
		pMonster:AddParticle( "Nemo_Flame_Shot_01", 0.42, 0.85 )
		pMonster:AddParticle( "Nemo_Flame_Shot_02", 0.38, 0.85 )
		pMonster:AddParticle( "Nemo_Flame_Shot_03", 0.42, 0.85 )
		pMonster:AddParticle( "Nemo_Flame_Shot_04", 0.35, 0.85 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK03_ING" )
    end
end

--  ��Ÿ ����Ʈ
local count = 1
function nemophilaGhost_Attack03_ingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 12 ) then
		pMonster:PlaySound( "986018" )
		pMonster:PlaySound( "986019" )
		
    elseif( iFrame == 15 ) then
		local offsetX = 0.3
		local offsetY = 0.9
		
		pMonster:ComputeAngleToTarget( offsetX, offsetY ) -- Ÿ�������� ������ ���
		local angle = pMonster:GetAngleToTarget()
		if( ( pMonster:GetX() + offsetX > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
		    ( pMonster:GetX() - offsetX< pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
			angle = angle * -1.0 + 3.141592
		end
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_HERO_NEMOPHILLA_FLAME, offsetX, offsetY, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_HERO_NEMOPHILLA_FLAME, offsetX, offsetY, false, -angle )
		end
		pMonster:AddParticle( "Iblis_Laser_Shot_01", 0.34, 0.85 )
		pMonster:AddParticle( "Iblis_Laser_Shot_02", 0.34, 0.85 )
		pMonster:AddParticle( "Mistone_Spark_04", 0.34, 0.85 )
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        if( count >= pMonster:GetCountValue() ) then
			pMonster:SetState( "ATTACK03_END" )
		else
			count = count + 1
			pMonster:SetState( "ATTACK03_ING" )
		end
    end
end

--  ��Ÿ ����Ʈ
function nemophilaGhost_Attack03_endFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		count = 1
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- ����
function nemophilaGhost_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetCountValue(2)		
    elseif( iFrame == 15 ) then
		pMonster:AddParticle( "Nemo_Flame_Shot_01", 0.3, 0.9 )
		pMonster:AddParticle( "Nemo_Flame_Shot_02", 0.3, 0.9 )
		pMonster:AddParticle( "Nemo_Flame_Shot_03", 0.3, 0.9 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK03_ING" )
    end
end

-- ����
function nemophilaGhost_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetCountValue(3)
	elseif( iFrame == 15 ) then
		pMonster:AddParticle( "Nemo_Flame_Shot_01", 0.3, 0.9 )
		pMonster:AddParticle( "Nemo_Flame_Shot_02", 0.3, 0.9 )
		pMonster:AddParticle( "Nemo_Flame_Shot_03", 0.3, 0.9 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK03_ING" )
    end
end

-- ������ ��
function nemophilaGhost_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 27 ) then
		pMonster:PlaySound( "986021" )
		pMonster:PlaySound( "986022" )
	elseif( iFrame == 30 ) then
		pMonster:AddDamageWithLocate( DT_HERO_NEMOPHILLA_CURSE_SPRING, pMonster:GetTargetX(), pMonster:GetTargetY(), true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ����
function nemophilaGhost_Attack07Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ����
function nemophilaGhost_Attack09Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 27 ) then
		--pMonster:PlaySound( "986027" )
	elseif( iFrame == 30 ) then
		pMonster:AddDamageWithLocate( DT_HERO_NEMOPHILLA_FALL, pMonster:GetTargetX(), pMonster:GetTargetY(), true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ����
function nemophilaGhost_Attack10Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ��ũ�õ�
function nemophilaGhost_Attack11Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 27 ) then
		pMonster:PlaySound( "986029" )
	elseif( iFrame == 30 ) then
		local posx = 0.45
		local posy = 0.3
		
		
		pMonster:AddDamage(DT_HERO_NEMOPHILLA_FIELD)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- ����
function nemophilaGhost_breakFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetShield(0.0)
	elseif( iFrame == 27 ) then
		pMonster:PlaySound( "986029" )
	elseif( iFrame == 30 ) then
		local posx = 0.45
		local posy = 0.3
		
		
		pMonster:AddDamage(DT_HERO_NEMOPHILLA_FIELD)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ����
function nemophilaGhost_Attack12Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 27 ) then
		pMonster:PlaySound(986028)
		local posy = 0.0
		pMonster:AddParticle("Iblis_Summon_01", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_02", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_03", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_04", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_05", 0.0, posy)
		
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = -200
        pMon.fY = 200
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = -100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = 100
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = 200
        pMon.fY = 200
        pMonster:SummonMonster( pMon )
		
	elseif( iFrame == 73 ) then
		local posy = 0.0
		pMonster:AddParticle("Iblis_Summon_01", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_02", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_03", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_04", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_05", 0.0, posy)
		
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = -250
        pMon.fY = 250
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = -150
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = 150
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = 250
        pMon.fY = 250
        pMonster:SummonMonster( pMon )
	elseif( iFrame == 123 ) then
		local posy = 0.0
		pMonster:AddParticle("Iblis_Summon_01", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_02", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_03", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_04", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_05", 0.0, posy)
		
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = -350
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_WEAK_GAUNT
        pMon.fX = -350
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ����
function nemophilaGhost_Attack13Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 20 ) then
		--pMonster:PlaySound( "986030" )
		local posy = 1.17
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_01", 0, posy )
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_02", 0, posy )
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_03", 0, posy )
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_04", 0, posy )
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_05", 0, posy )
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_06", 0, posy )
		pMonster:AddParticleNoDirection( "Nemo_DemonCast_07", 0, posy )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function nemophilaGhost_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )				
    end
end

--  �ڷ���Ʈ ����
function nemophilaGhost_TeleportFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:AddParticle( "nemophilaGhost_Warp_01", 0.0, -0.34 )
		pMonster:AddParticle( "nemophilaGhost_Warp_02", 0.0, -0.34 )
    elseif( iFrame == 2 ) then
		pMonster:ToggleRender( false )
		pMonster:SetPushCheck( false )
		pMonster:SetInvincibleFrame( 20 )
		pMonster:PlaySound( "995026" )
		
		local fRand = pMonster:FloatRand()
		local fDistX = 0.2

		if ( fRand < 0.5 ) then			
			fDistX = 0.2
			if( pMonster:GetTargetIsRight() == true ) then
				pMonster:SetX( pMonster:GetTargetX() - fDistX )
			else
				pMonster:SetX( pMonster:GetTargetX() + fDistX )
			end
			
			pMonster:SetCountValue( 1 )
			
		elseif ( fRand <= 1.0 ) then
			fDistX = 0.7
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetX( pMonster:GetTargetX() - fDistX )
			else
				pMonster:SetX( pMonster:GetTargetX() + fDistX )
			end
			
			pMonster:SetCountValue( 2 )
			
		elseif ( fRand < 1.0 ) then		-- ���� ���� �ȵ����� ��
			fDistX = 0.3
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetX( pMonster:GetTargetX() - fDistX )
			else
				pMonster:SetX( pMonster:GetTargetX() + fDistX )
			end
			
			pMonster:SetCountValue( 3 )		
		end
		
		pMonster:SetY( pMonster:GetTargetY() + 0.1 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  �ڷ���Ʈ ����
function nemophilaGhost_Teleport2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:AddParticle( "Iblis_Teleport_01", 0.0, 0.74 )
		pMonster:AddParticle( "Iblis_Teleport_02", 0.0, 0.74 )
		pMonster:AddParticle( "Iblis_Teleport_03", 0.0, 0.74 )
		pMonster:ToggleRender( false )
		pMonster:SetPushCheck( false )
		pMonster:SetInvincibleFrame( 20 )
		pMonster:PlaySound( "995026" )
	elseif( iFrame == 2 ) then
		local fDistX = 0.2
		
		if( pMonster:GetTargetIsRight() == true ) then
            pMonster:SetX( pMonster:GetTargetX() - fDistX )
        else
            pMonster:SetX( pMonster:GetTargetX() + fDistX )
        end
		pMonster:SetY( pMonster:GetTargetY() + 0.1 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  �ڷ���Ʈ ���� ����
function nemophilaGhost_TeleportLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then
		pMonster:AddParticle( "Iblis_Teleport_01", 0.0, 0.74 )
		pMonster:AddParticle( "Iblis_Teleport_02", 0.0, 0.74 )
		pMonster:AddParticle( "Iblis_Teleport_03", 0.0, 0.74 )
    elseif( iFrame == 6 ) then
		pMonster:ToggleRender( true )
		pMonster:SetPushCheck( true )
    elseif( iFrame == 10 ) then
		pMonster:SetInvincible( false )
	elseif( iFrame >= 15 ) then
	--[[
        if( pMonster:GetCountValue() == 1 ) then
			pMonster:SetState( "ATTACK03" )   -- ����
		elseif( pMonster:GetCountValue() == 2 ) then
			pMonster:SetState( "ATTACK01" )   -- ����
		elseif( pMonster:GetCountValue() == 3 ) then
			pMonster:SetState( "ATTACK04" )   -- ���׿�
		else
		--]]
			pMonster:SetState( "WAIT" )   -- �����ֱ�
		--end
		
		pMonster:SetCountValue(0)
    end
end
-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function nemophilaGhost_Check_shield( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( sheild_check == false and pMonster:GetShield() <= 0.0 ) then
		pMonster:SetState("SHEILD_BREAK")
		sheild_check = true
    end
end

function nemophilaGhost_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -400, 400, 400, -400 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function nemophilaGhost_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1000, 1000, 1000, -800 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function nemophilaGhost_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function nemophilaGhost_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -150, 180, 150, -100 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function nemophilaGhost_Check_WalkStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -200, 400, 200, -400 ) == true or pMonster:FloatRand() < 0.2) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function nemophilaGhost_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function nemophilaGhost_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:FloatRand() < 0.75 ) then
		--pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function nemophilaGhost_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 200, 150, -100 ) == true ) then
		--pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function nemophilaGhost_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -500, 500, 500, -400 ) == true ) then
        pMonster:SetState( "ATTACK03" )
        pMonster:ResetDelay()
    end
end

function nemophilaGhost_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSummonedMonsterCount() < 2 ) then
		--pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK04" )
        pMonster:ResetDelay()
    end
end


function nemophilaGhost_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -500, 500, 500, -400 ) == true ) then
		--pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK06" )
        pMonster:ResetDelay()
    end
end


function nemophilaGhost_Check_Attack08( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetShield() ) then
		return
	else
		--pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK08" )
        pMonster:ResetDelay()
    end
end



function nemophilaGhost_Check_Attack11( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( pMonster:GetShield() ) then
		return
	end

    if( pMonster:CheckTargetInRange( 200, -500, 500, 500, -400 ) == true ) then
		--pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK11" )
        pMonster:ResetDelay()
    end
end


function nemophilaGhost_Check_Attack12( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -500, 500, 500, -400 ) == true ) then
		--pMonster:TurnToTarget()
        pMonster:SetState( "ATTACK12" )
        pMonster:ResetDelay()
    end
end

function nemophilaGhost_Check_Teleport( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    
    if( pMonster:GetShield() ) then
		return
	end


    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 100, -400, 350, 400, -250 ) == false ) then
		pMonster:SetState( "TELEPORT" )
		pMonster:ResetDelay()
    end
end

function nemophilaGhost_Check_Teleport2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 50, -220, 350, 220, -250 ) == true ) then
		pMonster:SetState( "TELEPORT2" )
		pMonster:ResetDelay()
    end
end

function nemophilaGhost_Check_TeleportLanding( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:TurnToTarget()
	pMonster:SetState( "TELEPORT_LANDING" )
	pMonster:ResetDelay()	
end


-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnnemophilaGhost_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

	if( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end
end

function OnnemophilaGhost_Die( iMonsterIndex )
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

function OnnemophilaGhost_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:SetFly( false )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
	if ( pMonster:CheckState( "COUNTER" ) == false and pMonster:CheckState( "COUNTER_DOWN" ) == false and pMonster:FloatRand() < 0.1 and pMonster:IsSuperArmor() == false ) then	
		local fRand = pMonster:FloatRand()
		if ( fRand < 0.5 ) then
			pMonster:SetState( "ATTACK05" )
		elseif ( fRand >= 0.5 and fRand < 0.75 ) then
			pMonster:SetState( "ATTACK02" )
		else
			pMonster:SetState( "ATTACK06" )
		end
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor(true)
	end
	

end

function OnnemophilaGhost_ShieldDamage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( pMonster:GetIsRight() ) then
		if( pMonster:IsBackAttack() ) then
			pMonster:AddParticle( "Setesh_Field_01", 0 , 0.5 )
		else
			pMonster:AddParticle( "Setesh_Field_01_R", 0 , 0.5 )
		end
	else
		if( pMonster:IsBackAttack() ) then
			pMonster:AddParticle( "Setesh_Field_01_R", 0 , 0.5 )
		else
			pMonster:AddParticle( "Setesh_Field_01", 0 , 0.5 )
		end
		
    end
	
end


function nemophilaGhost_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * fSpeedX )
	pMonster:SetSpeedY( pMonster:GetWalkSpeed() * fSpeedY )
end
