-- AI_KaruelBorder_Archer.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Mon_Archer_f_Wait.frm",
        Func    = "KaruelBorderArcher_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderArcher_Check_Targeting",
                DelayFrame          = 20,
            },
            -- Ÿ������
            {
                AICheckFrame        = 55,
                AIFunc              = "KaruelBorderArcher_Check_ReleaseTarget",
                DelayFrame          = 100,
            },
            -- Ÿ�� �ݴ�� ��
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderArcher_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderArcher_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderArcher_Check_JumpDown",
                DelayFrame          = 20,
            },
            -- �ȱ�
            {
                AICheckFrame        = 220,
                AIFunc              = "KaruelBorderArcher_Check_Walk",
                DelayFrame          = 550,
            },
            -- ��������
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderArcher_Check_RunAway",
                DelayFrame          = 25,
            },
            ---- ������(�̵�)
            --{
            --    AICheckFrame        = 55,
            --    AIFunc              = "KaruelBorderArcher_Check_Idle",
            --    DelayFrame          = 110,
            --},
			-- Attack01
            {
                AICheckFrame        = 30,
                AIFunc              = "KaruelBorderArcher_Check_Attack01",
                DelayFrame          = 55,
            },
			-- Attack02
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderArcher_Check_Attack02",
                DelayFrame          = 20,
            },
			-- Attack03
            {
                AICheckFrame        = 110,
                AIFunc              = "KaruelBorderArcher_Check_Attack03",
                DelayFrame          = 300,
            },
			---- Attack04
            --{
            --    AICheckFrame        = 20,
            --    AIFunc              = "KaruelBorderArcher_Check_Attack04",
            --    DelayFrame          = 80,
            --},
            -- ����������
            {
                AICheckFrame        = 55,
                AIFunc              = "KaruelBorderArcher_Check_Attack05",
                DelayFrame          = 150,
            },
        },
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Mon_Archer_f_Run.frm",
        Func            = "KaruelBorderArcher_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "KaruelBorderArcher_MoveFail",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderArcher_Check_Targeting",
                DelayFrame          = 40,
            },
            -- Ÿ������
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderArcher_Check_ReleaseTarget",
                DelayFrame          = 50,
            },
			-- Ÿ�� �ݴ�� ��
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderArcher_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderArcher_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderArcher_Check_JumpDown",
                DelayFrame          = 20,
            },
			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderArcher_Check_Stop",
                DelayFrame          = 40,
            },
			-- Attack02
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderArcher_Check_Attack02",
                DelayFrame          = 10,
            },
			---- ������(�̵�)
            --{
            --    AICheckFrame        = 140,
            --    AIFunc              = "KaruelBorderArcher_Check_Idle",
            --    DelayFrame          = 100,
            --},
        }
    },
    
     -- ������
    {
        ID              = "IDLE",
        Motion          = "Mon_Archer_f_Run.frm",
        Func            = "KaruelBorderArcher_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "KaruelBorderArcher_IdleMoveFail",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 40,
                AIFunc              = "KaruelBorderArcher_Check_Targeting",
                DelayFrame          = 110,
            },
			-- �ɽ��ϴϱ� ���⵵ �ѹ��� �ٲ��ְ�.
			{
                AICheckFrame        = 40,
                AIFunc              = "KaruelBorderArcher_Check_Turnning",
                DelayFrame          = 110,
            },
            -- ������(����)
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderArcher_Check_Idle_Stop",
                DelayFrame          = 10,
            },
        }
    },
    -- ��������
    {
        ID      = "RUNAWAY",
        Motion  = "Mon_Archer_f_Run.frm",
        Func    = "KaruelBorderArcher_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "KaruelBorderArcher_RunAwayMoveFail",


        Trigger =
        {
			-- ȸ�ǰ���
            {
                AICheckFrame        = 25,
                AIFunc              = "KaruelBorderArcher_Check_Attack02",
                DelayFrame          = 75,
            },
             -- ����
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderArcher_Check_RunAwayStop",
                DelayFrame          = 10,
            },
        }
    },
    -- Attack01
    {
        ID      = "ATTACK01",
        Motion  = "Mon_Archer_f_Attack01.frm",
        Func    = "KaruelBorderArcher_Attack01Func",
    },
    
    -- ATTACK02_RIGHT
    {
        ID      = "ATTACK02_RIGHT",
        Motion  = "Mon_Archer_f_Attack02_back.frm",
        Func    = "KaruelBorderArcher_Attack02_RightFunc",
    },
	
    -- ATTACK02_LEFT
    {
        ID      = "ATTACK02_LEFT",
        Motion  = "Mon_Archer_f_Attack02.frm",
        Func    = "KaruelBorderArcher_Attack02_LeftFunc",
    },
	
    -- Attack03
    {
        ID      = "ATTACK03",
        Motion  = "Mon_Archer_f_Attack03.frm",
        Func    = "KaruelBorderArcher_Attack03Func",
    },
	
    ---- Attack04
    --{
    --    ID      = "ATTACK04",
    --    Motion  = "Mon_Archer_f_Attack04.frm",
    --    Func    = "KaruelBorderArcher_Attack04Func",
    --},
    
    -- Attack05
    {
        ID      = "ATTACK05",
        Motion  = "Mon_Archer_f_Jump_Attack.frm",
        Func    = "KaruelBorderArcher_Attack05Func",
    },

    -- ����
    {
        ID      = "JUMP",
        Motion  = "Mon_Archer_f_Jump_up.frm",
        Func    = "KaruelBorderArcher_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Mon_Archer_f_Jump_down.frm",
        Func    = "KaruelBorderArcher_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Mon_Archer_f_Jump_landing.frm",
        Func    = "KaruelBorderArcher_ToWait",
    },
    
	
    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Mon_Archer_f_Damage_Up.frm",
        Func    = "KaruelBorderArcher_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Mon_Archer_f_Damage_Middle.frm",
        Func    = "KaruelBorderArcher_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Mon_Archer_f_Damage_Down.frm",
        Func    = "KaruelBorderArcher_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "Mon_Assassin_f_Down_up01.frm",
        Func    = "KaruelBorderArcher_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "KaruelBorderArcher_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Mon_Assassin_f_Down_up02.frm",
        Func    = "KaruelBorderArcher_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Mon_Assassin_f_Down_up03.frm",
        Func    = "KaruelBorderArcher_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "KaruelBorderArcher_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Mon_Assassin_f_Down_Middle.frm",
        Func    = "KaruelBorderArcher_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "KaruelBorderArcher_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "Mon_Assassin_f_Down_Down.frm",
        Func    = "KaruelBorderArcher_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "KaruelBorderArcher_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Mon_Assassin_f_Down_Special01.frm",
        Func    = "KaruelBorderArcher_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Mon_Assassin_f_Down_Special02.frm",
        Func    = "KaruelBorderArcher_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "KaruelBorderArcher_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- �ױ� ����
    {
        ID      = "DIE",
        Motion  = "Mon_Assassin_f_Down_Middle.frm",
        Func    = "KaruelBorderArcher_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Mon_Archer_f_Standup.frm",
        Func    = "KaruelBorderArcher_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Mon_Assassin_f_Stone.frm",
        Func    = "KaruelBorderArcher_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Mon_Assassin_f_Stone.frm",
        Func    = "KaruelBorderArcher_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Mon_Assassin_f_Stone.frm",
		Func	= "KaruelBorderArcher_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnKaruelBorderArcher_Land",
    Die     = "OnKaruelBorderArcher_Die",
    Damage  = "OnKaruelBorderArcher_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitKaruelBorder_Archer( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:RegistReaction( ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     	"DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, 	"DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   	"DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, 	ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, 	ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, 	ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, 	ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, 	ATTACKDIR_NORMAL,   "ICECURSE" )
	
	pMonster:SetInitAI( true )
	pMonster:SetCountValue( 0 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function KaruelBorderArcher_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetPushCheck( TRUE )
	--pMonster:RenderBox( 200, -200, 150, 200, -150 )
	if( pMonster:GetInitAI() ) then
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_01", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_02", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_03", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_04", 0.0, 0.0 )
		pMonster:SetInitAI( false )
	end
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function KaruelBorderArcher_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetRunSpeed() )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function KaruelBorderArcher_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- Attack01
function KaruelBorderArcher_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 55 ) then
		--pMonster:PlaySound(11)
		pMonster:PlaySound(1304)
		if( pMonster:GetIsRight() ) then
			if( 2 <= g_MyD3D:GetDungeonLevel() ) then
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK01_ADDEFF, 0.0, 0.05, true )
			else
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK01, 0.0, 0.05, true )
			end
		else
			if( 2 <= g_MyD3D:GetDungeonLevel() ) then
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK01_R_ADDEFF, 0.0, 0.05, true )
			else
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK01_R, 0.0, 0.05, true )
			end
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

-- Attack02_Right
function KaruelBorderArcher_Attack02_RightFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetPushCheck(false)
		--pMonster:SetSuperArmor( true )
    elseif( iFrame == 35 ) then
		pMonster:PlaySound(1304)
		if( pMonster:GetIsRight() ) then
			if( 2 <= g_MyD3D:GetDungeonLevel() ) then
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK02_ADDEFF, 0.0, 0.0, true )
			else
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK02, 0.0, 0.0, true )
			end
		else
			if( 2 <= g_MyD3D:GetDungeonLevel() ) then
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK02_R_ADDEFF, 0.0, 0.0, true )
			else
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK02_R, 0.0, 0.0, true )
			end
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck(true)
		pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
    end
end

-- Attack02_Left
function KaruelBorderArcher_Attack02_LeftFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetPushCheck(false)
		--pMonster:SetSuperArmor( true )
    elseif( iFrame == 35 ) then
		pMonster:PlaySound(1304)
		if( pMonster:GetIsRight() ) then
			if( 2 <= g_MyD3D:GetDungeonLevel() ) then
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK02_R_ADDEFF, 0.0, 0.0, true )
			else
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK02_R, 0.0, 0.0, true )
			end
		else
			if( 2 <= g_MyD3D:GetDungeonLevel() ) then
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK02_ADDEFF, 0.0, 0.0, true )
			else
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK02, 0.0, 0.0, true )
			end
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck(true)
		pMonster:SetSuperArmor( false )
		
		if( pMonster:GetIsRight() ) then
			pMonster:SetIsRight( false )
		else
			pMonster:SetIsRight( true )
		end
        pMonster:SetState( "WAIT" )
    end
end

-- Attack03
function KaruelBorderArcher_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		--pMonster:SetPushCheck(false)
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 50 ) then
			pMonster:AddParticle( "Dun_Karuel1_Archer_Energy_01", 0.2, 0.25 )
			pMonster:AddParticle( "Dun_Karuel1_Archer_Energy_02", 0.2, 0.25 )
			pMonster:AddParticle( "Dun_Karuel1_Archer_Energy_03", 0.2, 0.25 )
			pMonster:AddParticle( "Dun_Karuel1_Archer_Energy_04", 0.2, 0.25 )
			pMonster:AddParticle( "Dun_Karuel1_Archer_Energy_05", 0.2, 0.25 )
	elseif( iFrame == 65 ) then
		pMonster:PlaySound(1368)
		if( pMonster:GetIsRight() ) then
			if( 2 <= g_MyD3D:GetDungeonLevel() ) then
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_1_ADDEFF, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_2_ADDEFF, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_3_ADDEFF, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_4_ADDEFF, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_5_ADDEFF, 0.0, 0.0, true )
				pMonster:AddParticle( "Dun_Karuel1_Archer_Shot_01", 0.2, 0.25 )
				pMonster:AddParticle( "Dun_Karuel_Golem_Shot_01", 0.2, 0.25 )
				pMonster:AddParticle( "Dun_Karuel_Golem_Shot_03", 0.2, 0.25 )
				pMonster:AddParticle( "Dun_Karuel_Golem_Shot_04", 0.2, 0.25 )
			else
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_1, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_2, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_3, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_4, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_5, 0.0, 0.0, true )
				pMonster:AddParticle( "Dun_Karuel1_Archer_Shot_01", 0.2, 0.25 )
				pMonster:AddParticle( "Dun_Karuel_Golem_Shot_01", 0.2, 0.25 )
				pMonster:AddParticle( "Dun_Karuel_Golem_Shot_03", 0.2, 0.25 )
				pMonster:AddParticle( "Dun_Karuel_Golem_Shot_04", 0.2, 0.25 )
			end
		else
			if( 2 <= g_MyD3D:GetDungeonLevel() ) then
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_1_R_ADDEFF, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_2_R_ADDEFF, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_3_R_ADDEFF, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_4_R_ADDEFF, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_5_R_ADDEFF, 0.0, 0.0, true )
				pMonster:AddParticle( "Dun_Karuel1_Archer_Shot_01_R", 0.2, 0.25 )
				pMonster:AddParticle( "Dun_Karuel_Golem_Shot_01", 0.2, 0.25 )
				pMonster:AddParticle( "Dun_Karuel_Golem_Shot_03", 0.2, 0.25 )
				pMonster:AddParticle( "Dun_Karuel_Golem_Shot_04", 0.2, 0.25 )
			else
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_1_R, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_2_R, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_3_R, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_4_R, 0.0, 0.0, true )
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK03_5_R, 0.0, 0.0, true )
				pMonster:AddParticle( "Dun_Karuel1_Archer_Shot_01_R", 0.2, 0.25 )
				pMonster:AddParticle( "Dun_Karuel_Golem_Shot_01", 0.2, 0.25 )
				pMonster:AddParticle( "Dun_Karuel_Golem_Shot_03", 0.2, 0.25 )
				pMonster:AddParticle( "Dun_Karuel_Golem_Shot_04", 0.2, 0.25 )
			end
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

-- Attack04
function KaruelBorderArcher_Attack04Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 40 ) then
		pMonster:AddParticle( "Dun_Karuel1_Archer_Energy_01", -0.02, 0.4 )
		pMonster:AddParticle( "Dun_Karuel1_Archer_Energy_02", -0.02, 0.4 )
		pMonster:AddParticle( "Dun_Karuel1_Archer_Energy_03", -0.02, 0.4 )
		pMonster:AddParticle( "Dun_Karuel1_Archer_Energy_04", -0.02, 0.4 )
		pMonster:AddParticle( "Dun_Karuel1_Archer_Energy_05", -0.02, 0.4 )
	elseif( iFrame == 55 ) then
		local vTargetPosX
		local vTargetPosY
		if( pMonster:IsTarget() ) then
			vTargetPosX = pMonster:GetTargetX()
			vTargetPosY = pMonster:GetTargetY()
		else
			vTargetPosX = pMonster:GetX()
			vTargetPosY = pMonster:GetY()
		end
		pMonster:Setv3TempValue( vTargetPosX, vTargetPosY, 0.0 )
		pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DROPPOS, vTargetPosX, vTargetPosY )
		pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DROPPOS, vTargetPosX, vTargetPosY - 1.5 )
		pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DROPPOS, vTargetPosX, vTargetPosY - 1.0 )
		pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DROPPOS, vTargetPosX, vTargetPosY - 0.5 )
		pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DROPPOS, vTargetPosX, vTargetPosY + 0.5 )
		pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DROPPOS, vTargetPosX, vTargetPosY + 1.0 )
		pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DROPPOS, vTargetPosX, vTargetPosY + 1.5 )
		pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DROPPOS, vTargetPosX, vTargetPosY + 2.0 )
		pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DROPPOS, vTargetPosX, vTargetPosY + 2.5 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
    end
	
	if( iFrame == 80 ) then
			pMonster:AddParticle( "Dun_Karuel1_Archer_Shot_01_U", 0.0, 0.4 )
			pMonster:AddParticle( "Dun_Karuel_Golem_Shot_01", 0.0, 0.4 )
			pMonster:AddParticle( "Dun_Karuel_Golem_Shot_03_U", 0.0, 0.4 )
			pMonster:AddParticle( "Dun_Karuel_Golem_Shot_04", 0.0, 0.4 )
	--if( 40 <= iFrame and iFrame < 80 ) then
		--if( 0 == math.mod(iFrame, 5) ) then
			if( 2 <= g_MyD3D:GetDungeonLevel() ) then
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK04_UPARROW_ADDEFF, 0.0, 0.0, true )
			else
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK04_UPARROW, 0.0, 0.0, true )
			end				
		--end
	end
	
	if( 100 <= iFrame and iFrame < 130 ) then
		if( 0 == math.mod(iFrame, 5) ) then
			local bOriIsRight = pMonster:GetIsRight()
			pMonster:SetIsRight( true )
			
			local vTargetPos = pMonster:Getv3TempValue()
			local vXPos = math.mod(iFrame, 3)
			if( 2 <= g_MyD3D:GetDungeonLevel() ) then
				pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DOWNARROW_ADDEFF, vTargetPos.x + (vXPos*0.12), vTargetPos.y + 4.6 )
				pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DOWNARROW_ADDEFF, vTargetPos.x + (vXPos*-0.12), vTargetPos.y + 4.6 )
			else
				pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DOWNARROW, vTargetPos.x + (vXPos*0.12), vTargetPos.y + 4.6 )
				pMonster:AddDamageWithStatic( DT_KARUELBORDER_ARCHER_ATTACK04_DOWNARROW, vTargetPos.x + (vXPos*-0.12), vTargetPos.y + 4.6 )
			end
			
			pMonster:SetIsRight( bOriIsRight )
		end
	end
end

-- Attack05
function KaruelBorderArcher_Attack05Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetInvincible( true )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 43 ) then
		pMonster:PlaySound(1300)
		if( pMonster:GetIsRight() ) then
			if( 2 <= g_MyD3D:GetDungeonLevel() ) then
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK05_ADDEFF, 0.0, 0.5, true )
			else
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK05, 0.0, 0.5, true )
			end
			pMonster:AddParticle( "Dun_Karuel1_Archer_Arrow45_Shot_01", 0.17, 0.64 )
			pMonster:AddParticle( "Dun_Karuel1_Archer_Arrow45_Shot_02", 0.17, 0.64 )
			pMonster:AddParticle( "Dun_Karuel1_Archer_Arrow45_Shot_03", 0.17, 0.64 )
			pMonster:AddParticle( "Dun_Karuel1_Archer_Arrow45_Shot_04", 0.17, 0.64 )
		else
			if( 2 <= g_MyD3D:GetDungeonLevel() ) then
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK05_R_ADDEFF, 0.0, 0.5, true )
			else
				pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_ARCHER_ATTACK05_R, 0.0, 0.5, true )
			end
			pMonster:AddParticle( "Dun_Karuel1_Archer_Arrow45_Shot_01_R", 0.17, 0.64 )
			pMonster:AddParticle( "Dun_Karuel1_Archer_Arrow45_Shot_02_R", 0.17, 0.64 )
			pMonster:AddParticle( "Dun_Karuel1_Archer_Arrow45_Shot_03_R", 0.17, 0.64 )
			pMonster:AddParticle( "Dun_Karuel1_Archer_Arrow45_Shot_04_R", 0.17, 0.64 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetPushCheck( true )
		pMonster:SetInvincible( false )
		pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function KaruelBorderArcher_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	 if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
    
end

--  ���� �ٿ� ����
function KaruelBorderArcher_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  �������� ����Ʈ��
function KaruelBorderArcher_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ������ ��, ��, ��
function KaruelBorderArcher_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function KaruelBorderArcher_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function KaruelBorderArcher_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� �� ����, �ٿ�̵�
function KaruelBorderArcher_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetInvincible( true )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )				
		
		if( pMonster:GetHP() <= 0 ) then
			if( 0 == pMonster:GetCountValue() ) then
				pMonster:PlaySound(607)
				pMonster:AddCountValue( 1 )
			end
			pMonster:EndMonster()
		end		
    end
end

-- �ٿ� ��
function KaruelBorderArcher_DownDownFunc( iMonsterIndex, iFrame )
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
function KaruelBorderArcher_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function KaruelBorderArcher_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetInvincible( true )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:EndMonster()
		end        		
    end
end

-- �ױ� ����
function KaruelBorderArcher_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		--pMonster:PlaySound(992001)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- �Ͼ��
function KaruelBorderArcher_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function KaruelBorderArcher_StoneCurseFunc( iMonsterIndex, iFrame )
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
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DOWN_MIDDLE" )
		else
			pMonster:SetState( "WAIT" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function KaruelBorderArcher_IceCurseFunc( iMonsterIndex, iFrame )
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
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DOWN_MIDDLE" )
		else
			pMonster:SetState( "WAIT" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function KaruelBorderArcher_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Small", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DOWN_MIDDLE" )
		else
			pMonster:SetState( "WAIT" )
		end
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function KaruelBorderArcher_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -600, 300, 600, -300 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function KaruelBorderArcher_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -600, 400, 600, -400 ) == false ) then
		pMonster:ReleaseTarget( true )
		pMonster:ResetDelay()
	end
end

function KaruelBorderArcher_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function KaruelBorderArcher_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -140, 800, 140, -800 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function KaruelBorderArcher_Check_RunAway( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -350, 200, 350, -200 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetIsRight( false )
		else
			pMonster:SetIsRight( true )
		end
    
        pMonster:SetState( "RUNAWAY" )
        pMonster:ResetDelay()
    end
end

function KaruelBorderArcher_Check_RunAwayStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -450, 250, 450, -250 ) == false ) then
    	pMonster:SetSpeedX( 0.0 )
    	pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )		
		pMonster:ResetDelay()
    end
end

function KaruelBorderArcher_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -200, 150, 200, -150 ) == false ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderArcher_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function KaruelBorderArcher_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -500, 50, 500, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderArcher_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, 50, 300, -100 ) == true ) then
		if( pMonster:GetTargetX() < pMonster:GetX() ) then
			if( 0.5 < pMonster:FloatRand() ) then
				pMonster:SetIsRight( true )
			else
				pMonster:SetIsRight( false )
			end
			pMonster:SetState( "ATTACK02_LEFT" )
		else
			if( 0.5 < pMonster:FloatRand() ) then
				pMonster:SetIsRight( true )
			else
				pMonster:SetIsRight( false )
			end
			pMonster:SetState( "ATTACK02_RIGHT" )
		end
		pMonster:ResetDelay()
	end
end

function KaruelBorderArcher_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 250, -350, 150, 350, -250 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderArcher_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -500, 250, 500, -250 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderArcher_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 150, 200, -150 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderArcher_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -500, 560, 500, 70 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		KaruelBorderArcher_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderArcher_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -500, -100, 500, -500 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function KaruelBorderArcher_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function KaruelBorderArcher_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������.. ����ٲٱ�
function KaruelBorderArcher_Check_Turnning( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( false == pMonster:IsTarget() and pMonster:FloatRand() < 0.3 ) then
        pMonster:SetIsRight( not pMonster:GetIsRight() )
		pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function KaruelBorderArcher_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnKaruelBorderArcher_Land( iMonsterIndex )
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

function OnKaruelBorderArcher_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and 
        pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and 
        pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and 
        pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()
	
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.02 )
		else
			pMonster:SetSpeedX( 0.02 )
		end	
	
		pMonster:SetState( "DOWN_MIDDLE" )
	end
end

function OnKaruelBorderArcher_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetPushCheck( true )
	
	-- ���� �������� �߿� �¾�����
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
		
	-- �ߴ��߿� �¾�����
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
		end		
	end
    
	-- �ٿ� �߿� �¾����� �ٿ�̵��
	if( pMonster:CheckState( "DOWN_DOWN" ) and pMonster:GetIsContact() == false) then
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
    
	-- �ݰ�
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and 
        pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.03 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK01" )
		end
	end
end

function KaruelBorderArcher_Jump( iMonsterIndex )
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

function KaruelBorderArcher_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )			
		end
    else
		pMonster:SetState( "WAIT" )
		pMonster:SetSpeedX( 0 )
	end
end

function KaruelBorderArcher_IdleMoveFail( iMonsterIndex )
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

function KaruelBorderArcher_RunAwayMoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
			pMonster:SetNoCheckContact(27)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )
	end
end