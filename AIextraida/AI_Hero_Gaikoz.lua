-- AI_Gaikoz.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Gaikoz_Wait.frm",
        Func    = "Gaikoz_WaitFunc",

        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Gaikoz_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "Gaikoz_Check_ReleaseTarget",
                DelayFrame          = 550,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "Gaikoz_Check_TurnToTarget",
                DelayFrame          = 35,
            },

            -- �޸���
            {
                AICheckFrame        = 75,
                AIFunc              = "Gaikoz_Check_Run",
                DelayFrame          = 110,
            },
            
            -- ��ǳ����
            {
                AICheckFrame        = 55,
                AIFunc              = "Gaikoz_Check_Attack02",
                DelayFrame          = 110,
            },
            -- ��漶(���ñ��)
            {
                AICheckFrame        = 110,
                AIFunc              = "Gaikoz_Check_Attack03",
                DelayFrame          = 220,
            },
            -- �ϼ�
            {
                AICheckFrame        = 110,
                AIFunc              = "Gaikoz_Check_Attack04",
                DelayFrame          = 330,
            },
            -- �ͽų���
            {
                AICheckFrame        = 55,
                AIFunc              = "Gaikoz_Check_Attack06",
                DelayFrame          = 550,
            },
            
            -- NEW �ٰŸ� �ϼ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Gaikoz_Check_Attack08",
                DelayFrame          = 110,
            },
            
            -- NEW ���� ���Ÿ� �ϼ�
            {
                AICheckFrame        = 45,
                AIFunc              = "Gaikoz_Check_Attack09",
                DelayFrame          = 55,
            },

            -- �밢�� �˱� ������
            {
                AICheckFrame        = 45,
                AIFunc              = "Gaikoz_Check_Attack10",
                DelayFrame          = 55,
            },

            -- �밢�� �˱� ������
            {
                AICheckFrame        = 55,
                AIFunc              = "Gaikoz_Check_Attack11",
                DelayFrame          = 55,
            },

            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "Gaikoz_Check_HighJump",
                DelayFrame          = 55,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Gaikoz_Check_JumpDown",
                DelayFrame          = 55,
            },
        },
    },

    -- �޸���
    {
        ID      = "RUN",
        Motion  = "Gaikoz_Run.frm",
        Func    = "Gaikoz_RunFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Gaikoz_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Gaikoz_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Gaikoz_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- NEW ���� ���Ÿ� �ϼ�
            {
                AICheckFrame        = 35,
                AIFunc              = "Gaikoz_Check_Attack09",
                DelayFrame          = 35,
            },
            -- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "Gaikoz_Check_HighJump",
                DelayFrame          = 35,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Gaikoz_Check_JumpDown",
                DelayFrame          = 55,
            },
        }
    },
    
    -- ��ǳ����
    {
        ID      = "ATTACK02",
        Motion  = "Gaikoz_Attack02.frm",
        Func    = "Gaikoz_Attack02Func",
    },
    
    -- ��漶
    {
        ID      = "ATTACK03",
        Motion  = "Gaikoz_Attack03.frm",
        Func    = "Gaikoz_Attack03Func",
    },
    
    -- �ϼ�
    {
        ID      = "ATTACK04",
        Motion  = "Gaikoz_Attack04.frm",
        Func    = "Gaikoz_Attack04Func",
    },
    
    -- �濵��
    {
        ID      = "ATTACK05",
        Motion  = "Gaikoz_Attack05.frm",
        Func    = "Gaikoz_Attack05Func",
    },
    
    -- �ͽų���
    {
        ID      = "ATTACK06",
        Motion  = "Gaikoz_Attack06.frm",
        Func    = "Gaikoz_Attack06Func",
    },
	
	-- �ظ��ȯ
    {
        ID      = "ATTACK08",
        Motion  = "gaikoz_specialattack01.frm",
        Func    = "Gaikoz_Attack08Func",
    },
	
	-- �ظ��ȯ
    {
        ID      = "ATTACK09",
        Motion  = "gaikoz_specialattack02.frm",
        Func    = "Gaikoz_Attack09Func",
    },
	
	-- �ظ��ȯ
    {
        ID      = "ATTACK10",
        Motion  = "gaikoz_specialattack03.frm",
        Func    = "Gaikoz_Attack10Func",
    },
    
    -- �ظ��ȯ
    {
        ID      = "ATTACK11",
        Motion  = "gaikoz_specialattack04.frm",
        Func    = "Gaikoz_Attack11Func",
    },
    
    -- ȸ��
    {
        ID      = "AVOID",
        Motion  = "Gaikoz_Avoid.frm",
        Func    = "Gaikoz_AvoidFunc",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Gaikoz_Jump.frm",
        Func    = "Gaikoz_JumpFunc",
    },
    
    -- ���� ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Gaikoz_Jump_Landing.frm",
        Func    = "Gaikoz_JumpLandingFunc",
    },
    

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Gaikoz_Damage_Up.frm",
        Func    = "Gaikoz_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Gaikoz_Damage_Down.frm",
        Func    = "Gaikoz_DamageFunc",
    },
    
    -- �ٿ� ��01
    {
        ID      = "DOWN_UP01",
        Motion  = "Gaikoz_Down_Up01.frm",
        Func    = "Gaikoz_DownUp01Func",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Gaikoz_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Gaikoz_Down_Up02.frm",
        Func    = "Gaikoz_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Gaikoz_Down_Up03.frm",
        Func    = "Gaikoz_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Gaikoz_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
     -- �ٿ� ����� 
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Gaikoz_Down_Special.frm",
        Func    = "Gaikoz_DownFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Gaikoz_StandUp.frm",
        Func    = "Gaikoz_StandUpFunc",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Gaikoz_Die01.frm",
        Func    = "Gaikoz_DieFunc",
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Gaikoz_Die02.frm",
        Func    = "Gaikoz_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Gaikoz_Stone.frm",
        Func    = "Gaikoz_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Gaikoz_Stone.frm",
        Func    = "Gaikoz_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Gaikoz_Stone.frm",
		Func	= "Gaikoz_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnGaikoz_Land",
    Die     = "OnGaikoz_Die",
    Damage  = "OnGaikoz_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitGaikoz( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	--pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    --pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    --pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
	
	pMonster:AddTraceParticleToBone( "Hatshepsut_Fury_01", 1.0, 0, 8, 8, 0.0, 0.0 )
	pMonster:AddTraceParticleToBone( "Hatshepsut_Fury_02", 1.0, 0, 8, 8, 0.0, 0.0 )
	--pMonster:AddTraceParticleToBone( "Gai_Back_02", 1.0, 0, 6, 6, 0.0, 0.0 )
	--[[
	pMonster:ToggleExtraMesh("LIGHT", true)
	pMonster:AddParticleToChildMeshBone("LIGHT", "Gaikoz_Flame_01", 3, 5.0, 0.0, 0.0, false )
	pMonster:AddParticleToChildMeshBone("LIGHT", "Gaikoz_Flame_02", 3, 5.0, 0.0, 0.0, false )
	pMonster:ToggleExtraMesh("LIGHT1", true)
	pMonster:AddParticleToChildMeshBone("LIGHT1", "Gaikoz_Flame_01", 3, 5.0, 0.0, 0.0, false )
	pMonster:AddParticleToChildMeshBone("LIGHT1", "Gaikoz_Flame_02", 3, 5.0, 0.0, 0.0, false )
	--]]
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Gaikoz_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end




-- �޸��� ����
function Gaikoz_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.0 )    
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUN" )
    end
end

--  ��������01 ����
function Gaikoz_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= 31 and iFrame < 46 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 15.0 )
		
		if( iFrame == 31 ) then
			pMonster:AddDamage( DT_MONSTER_GAIKOZ01_01 )
		end
	elseif( iFrame == 46 ) then
		pMonster:SetPushCheck( true )
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 4.0 )
	elseif( iFrame == 51 ) then
		pMonster:AddDamage( DT_MONSTER_GAIKOZ01_02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��ǳ����
function Gaikoz_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	--elseif( iFrame == 41 ) then
	    --pMonster:SkillReadyEffectNoStop( 180, 50, 50, 0.0 )
	elseif( iFrame == 61 ) then
		pMonster:PlaySound(244)
		pMonster:AddDamage( DT_MONSTER_GAIKOZ03 )
	elseif( iFrame == 78 ) then
		pMonster:PlaySound(244)
		pMonster:AddDamage( DT_MONSTER_GAIKOZ03 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end    
end

--  ��漶 ����
function Gaikoz_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    --elseif( iFrame == 40 ) then
	    --pMonster:SkillReadyEffectNoStop( 80, 50, 50, 0.0 )
    elseif( iFrame == 60 ) then
		pMonster:PlaySound( "47" )
		pMonster:AddDamage( DT_MONSTER_GAIKOZ02_01 )
		pMonster:AddParticle( "Broken_Ground03", 0.3, 0.1 )		
		pMonster:AddParticle( "Broken_Ground04", 0.3, 0.0 )		
	elseif( iFrame == 63 ) then
		pMonster:AddDamage( DT_MONSTER_GAIKOZ02_02 )
		pMonster:AddDamage( DT_MONSTER_GAIKOZ02_03 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �ϼ� ����
function Gaikoz_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 30 ) then
	    pMonster:SkillReadyEffectNoStop( 180, 50, 50, 0.0 )
    elseif( iFrame >= 31 and iFrame < 46 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 15.0 )
		if( iFrame == 36 ) then
			pMonster:AddDamage( DT_MONSTER_GAIKOZ01_01 )
			pMonster:PlaySound(472)
		end
	elseif( iFrame == 46 ) then
		pMonster:SetPushCheck( true )
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 4.0 )
	elseif( iFrame == 50 ) then
		pMonster:AddDamage( DT_MONSTER_GAIKOZ01_02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetState( "WAIT" )
    end
end

--  �濵�� ����
function Gaikoz_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:ToggleRender( true )
        pMonster:SetPushCheck( true )
		pMonster:SetSuperArmor( true )
		pMonster:SetNoCheckContact(30)	
	elseif( iFrame == 16 ) then
		pMonster:PlaySound(537)
		pMonster:AddDamage( DT_MONSTER_GAIKOZ04	)		
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
		pMonster:SetFrameLock( true )        
    end
end

--  �ͽų��� ����
function Gaikoz_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetInvincible( true )
        pMonster:StartText( "DANGER" )
        pMonster:PlaySound( "129" )
    elseif( iFrame == 60 ) then
        pMonster:SkillReadyEffect( 255, 50, 50, 0.0 )
    elseif( iFrame == 71 ) then
		pMonster:PlaySound(247)
        pMonster:AddDamage( DT_MONSTER_GAIKOZ05 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end


--  NEW �ϼ�
function Gaikoz_Attack08Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 20 ) then
		pMonster:StartText("DANGER")
		pMonster:PlaySound( "986007" )
		local posx = 0.0
		local posy = 0.25
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection("Pariot_Eat_01", posx, posy)
		pMonster:AddParticleNoDirection("Pariot_Eat_02", posx, posy)
		pMonster:AddParticleNoDirection("Pariot_Eat_03", posx, posy)
		pMonster:AddParticleNoDirection("Pariot_Eat_05", posx, posy)
		pMonster:AddParticleNoDirection("Mistone_Spark_01", posx, posy)
		pMonster:AddParticleNoDirection("Iblis_Summon_03", posx, 0.0)
		pMonster:AddParticleNoDirection("Iblis_Laser_Charge_04", posx, 0.25)
    elseif( iFrame == 31 ) then
        pMonster:SkillReadyEffectNoStop( 128, 10, 10, 0.0 )
    elseif( iFrame == 40 ) then
		pMonster:AddDamage(DT_HERO_GAIKOZ_ATK1)
	elseif( iFrame == 43 ) then
		pMonster:PlaySound( "986008" )
		local posx = 0.40
		local posy = 0.25
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Nemo_Change_Boom_01", posx, posy)
			pMonster:AddParticleNoDirection("Nemo_Change_Boom_02", posx, posy)
			pMonster:AddParticleNoDirection("Nemo_Change_Boom_04", posx, posy)
			pMonster:AddParticleNoDirection("Gaikoz_Cut_01", posx, posy)
		else
			pMonster:AddParticleNoDirection("Nemo_Change_Boom_01", posx, posy)
			pMonster:AddParticleNoDirection("Nemo_Change_Boom_02", posx, posy)
			pMonster:AddParticleNoDirection("Nemo_Change_Boom_04", posx, posy)
			pMonster:AddParticleNoDirection("Gaikoz_Cut_01_R", posx, posy)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  NEW ���Ÿ� �ϼ�
function Gaikoz_Attack09Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 15 ) then
		pMonster:StartText("DANGER")
		pMonster:PlaySound( "986007" )
    elseif( iFrame >= 52 and iFrame <= 60 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 70.0 )
		if( iFrame == 53 ) then
			pMonster:AddDamage(DT_HERO_GAIKOZ_ATK2)
		elseif( iFrame == 56 ) then
			pMonster:PlaySound( "986009" )
		end
    elseif( iFrame == 61 ) then
		pMonster:SetSpeedX( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  �ͽų��� ����
function Gaikoz_Attack10Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 45 or iFrame == 58 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.0 ) -- Ÿ�������� ������ ���
		local angle = pMonster:GetAngleToTarget()
		if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		else
			angle = angle
        end
        pMonster:AddDamageWithLocateAngle( DT_HERO_GAIKOZ_ATK3, 0.0, 0.0, false, angle )
        pMonster:PlaySound(244)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  �ͽų��� ����
function Gaikoz_Attack11Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 50 or iFrame == 65 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.0 ) -- Ÿ�������� ������ ���
		local angle = pMonster:GetAngleToTarget()
		if( not pMonster:GetIsRight() ) then
			angle = angle * -1.0
		else
			angle = angle
        end
        pMonster:AddDamageWithLocateAngle( DT_HERO_GAIKOZ_ATK3, 0.0, 0.0, false, angle )
        pMonster:PlaySound(244)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetPushCheck( true )
        pMonster:SetState( "WAIT" )
    end
end

--  ȸ�� ����
function Gaikoz_AvoidFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:PlaySound(539)
		pMonster:ToggleRender( false )
        pMonster:SetPushCheck( false )
		pMonster:SetFly( true )		
        pMonster:SetInvincibleFrame( pMonster:GetLastFrame() + 5 )
        pMonster:AddParticle( "Gaikoz_silhouette01", 0.0, 0.3 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
		pMonster:SetFly( false )		  
        pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        pMonster:SetSpeedY( 0.01 )
        pMonster:AddParticle( "Gaikoz_silhouette01", 0.0, 0.3 )
        pMonster:SetState( "ATTACK05" )
    end
end

-- ���� ����
function Gaikoz_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �������� ����
function Gaikoz_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �״»���
function Gaikoz_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:ClearChildMeshOneTimeMotion( "LIGHT" )
		pMonster:ClearChildMeshOneTimeMotion( "LIGHT1" )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Gaikoz_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ�
function Gaikoz_DownFunc( iMonsterIndex, iFrame )
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
function Gaikoz_DownUp01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function Gaikoz_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function Gaikoz_DownUp03Func( iMonsterIndex, iFrame )
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
function Gaikoz_StandUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Gaikoz_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Gaikoz_IceCurseFunc( iMonsterIndex, iFrame )
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
function Gaikoz_HoldFunc( iMonsterIndex, iFrame )
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

function Gaikoz_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Gaikoz_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1500, 1000, 1500, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Gaikoz_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Gaikoz_Check_Run( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "RUN" )
        pMonster:ResetDelay()
    end
end

function Gaikoz_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 600, 150, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Gaikoz_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Gaikoz_Check_JumpDown( iMonsterIndex, iFrame )
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
function Gaikoz_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
        pMonster:SetState( "JUMPATTACK" )
        pMonster:ResetDelay()
    end
end

function Gaikoz_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 250, -250, 100, 250, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
    end
end

function Gaikoz_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -200, 500, 200, -200 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Gaikoz_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckState( "RUM" ) == true ) then
		if( pMonster:CheckTargetInRange( 300, -200, 100, 200, -100 ) == true ) then
			pMonster:AddCountValue(1)
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK04" )
			pMonster:ResetDelay()
		end
	else
		if( pMonster:CheckTargetInRange( 200, -200, 100, 200, -100 ) == true ) then
			pMonster:AddCountValue(1)
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK04" )
			pMonster:ResetDelay()
		end
    end
end

function Gaikoz_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -250, 500, 250, -100 ) == true and pMonster:GetCountValue() >= 5 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end

function Gaikoz_Check_Attack08( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 100, 150, -150 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK08" )
		pMonster:ResetDelay()
    end
end


function Gaikoz_Check_Attack09( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 700, -300, 100, 300, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK09" )
		pMonster:ResetDelay()
    end
end


function Gaikoz_Check_Attack10( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 600, -400, 600, 400, 100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK10" )
		pMonster:ResetDelay()
    end
end

function Gaikoz_Check_Attack11( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 600, -400, -100, 400, -600 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK11" )
		pMonster:ResetDelay()
    end
end


function Gaikoz_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function Gaikoz_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:FloatRand() < 0.2 and pMonster:IsTarget() == true ) then    
		
			pMonster:SetSpeedX( 0.0 )			
			pMonster:SetSpeedY( 0.0 )			
			
			if( pMonster:GetTargetIsRight() == true ) then
                pMonster:SetX( pMonster:GetTargetX() - 0.5 )
            else
                pMonster:SetX( pMonster:GetTargetX() + 0.5 )
            end
            
            pMonster:TurnToTarget()            
            local posy = pMonster:GetTargetY() + 0.4
			if( posy < 0.0 ) then
				posy = 0.4
			end
			pMonster:SetY( posy )
			pMonster:SetState( "AVOID" )
		else
			pMonster:SetState( "STANDUP" )
		end		
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnGaikoz_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "JUMP" ) == true ) then		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "JUMP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "ATTACK05" ) == true ) then
		pMonster:SetState( "ATTACK03" )
    end    
end

function OnGaikoz_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetState( "DIE" )
	end	
end

function OnGaikoz_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetPushCheck( true )	
	pMonster:SetFly( false )	
	pMonster:SetSpeedX( 9.0 * pMonster:GetSpeedX() / 10.0 )
    pMonster:SetSpeedY( 9.0 * pMonster:GetSpeedY() / 10.0 )
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
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

	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:IsSuperArmor() == false ) then
		if( pMonster:FloatRand() < 0.2 and pMonster:IsTarget() == true ) then    
			pMonster:SetSpeedX( 0.0 )			
			pMonster:SetSpeedY( 0.0 )					
			pMonster:SetY( pMonster:GetTargetY() + 0.4 )			
			
			if( pMonster:GetTargetIsRight() == true ) then
				pMonster:SetX( pMonster:GetTargetX() - 0.5 )
			else
				pMonster:SetX( pMonster:GetTargetX() + 0.5 )
			end
	        
			pMonster:TurnToTarget()                    
			
			if( pMonster:FloatRand() < 0.3 ) then
				pMonster:SetState( "ATTACK06" )
			elseif( pMonster:FloatRand() < 0.6 ) then
				pMonster:SetState( "ATTACK09" )
			else
				pMonster:SetState( "AVOID" )
			end
		end
	end
end

function Gaikoz_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
	
	if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
    end
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Gaikoz_MoveFail( iMonsterIndex )
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
