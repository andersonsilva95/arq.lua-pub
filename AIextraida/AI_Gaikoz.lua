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
            -- ��漶
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
			-- �ظ��ȯ
            {
                AICheckFrame        = 330,
                AIFunc              = "Gaikoz_Check_Attack07",
                DelayFrame          = 2200,
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
            -- �ϼ�
            {
                AICheckFrame        = 35,
                AIFunc              = "Gaikoz_Check_Attack04",
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
        ID      = "ATTACK07",
        Motion  = "Gaikoz_Attack07.frm",
        Func    = "Gaikoz_Attack07Func",
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
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
	
	pMonster:RegisterSummonMonsterType( MON_GHOST_BLADER )

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
	elseif( iFrame == 41 ) then
	    pMonster:SkillReadyEffectNoStop( 180, 50, 50, 0.0 )
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
    elseif( iFrame == 40 ) then
	    pMonster:SkillReadyEffectNoStop( 80, 50, 50, 0.0 )
    elseif( iFrame == 60 ) then
		pMonster:PlaySound( "47" )
		pMonster:AddDamageWithAngle( DT_MONSTER_GAIKOZ02_01 )
		pMonster:AddParticle( "Broken_Ground03", 0.3, 0.1 )		
		pMonster:AddParticle( "Broken_Ground04", 0.3, 0.0 )		
	elseif( iFrame == 63 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_GAIKOZ02_02 )
		pMonster:AddDamageWithAngle( DT_MONSTER_GAIKOZ02_03 )
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

--  �ظ��ȯ ����
function Gaikoz_Attack07Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 31 ) then
	    pMonster:SkillReadyEffectNoStop( 180, 50, 50, 0.0 )
    elseif( iFrame == 61 ) then
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_GHOST_BLADER
        pMon.fX = -200
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_GHOST_BLADER
        pMon.fX = 200
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
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

function Gaikoz_Check_Attack07( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetSummonedMonsterCount() < 1 ) then
		pMonster:SetState( "ATTACK07" )
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
            pMonster:SetY( pMonster:GetTargetY() + 0.4 )			
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

	if( pMonster:CheckState( "DOWN_UP01" ) == false  and pMonster:CheckState( "ATTACK05" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if( pMonster:FloatRand() < 0.1 and pMonster:IsTarget() == true ) then    
			pMonster:SetSpeedX( 0.0 )			
			pMonster:SetSpeedY( 0.0 )					
			pMonster:SetY( pMonster:GetTargetY() + 0.4 )			
			
			if( pMonster:GetTargetIsRight() == true ) then
				pMonster:SetX( pMonster:GetTargetX() - 0.5 )
			else
				pMonster:SetX( pMonster:GetTargetX() + 0.5 )
			end
	        
			pMonster:TurnToTarget()                    
			pMonster:SetState( "AVOID" )
		end
	end
end

function Gaikoz_Jump( iMonsterIndex )
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
