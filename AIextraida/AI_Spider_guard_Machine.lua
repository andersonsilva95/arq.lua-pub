-- AI_Spider_guard_Machine.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Spider_guard_Machine_Wait.frm",
        Func    = "Spider_guard_Machine_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 20,
                AIFunc              = "Spider_guard_Machine_Check_Targeting",
                DelayFrame          = 60,
            },

            -- Ÿ������
            --{
            --	AICheckFrame        = 300,
            --	AIFunc              = "Spider_guard_Machine_Check_ReleaseTarget",
            --	DelayFrame          = 100,
            --},

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 25,
                AIFunc              = "Spider_guard_Machine_Check_TurnToTarget",
                DelayFrame          = 5,
            },

            -- �ȱ�
            {
                AICheckFrame        = 30,
                AIFunc              = "Spider_guard_Machine_Check_Walk",
                DelayFrame          = 20,
            },

            -- ������
            {
                AICheckFrame        = 31,
                AIFunc              = "Spider_guard_Machine_Check_JumpUp",
                DelayFrame          = 40,
            },        

            -- �����ٿ�
            {
                AICheckFrame        = 32,
                AIFunc              = "Spider_guard_Machine_Check_JumpDown",
                DelayFrame          = 40,
            },

			-- �������� ����
            {
                AICheckFrame        = 20,
                AIFunc              = "Spider_guard_Machine_Check_Attack01",
                DelayFrame          = 120,
            },

            -- ������
            {
                AICheckFrame        = 30,
                AIFunc              = "Spider_guard_Machine_Check_Attack02",
                DelayFrame          = 300,
            },

            -- ���ӵ� ��ĭ
            {
                AICheckFrame        = 100,
                AIFunc              = "Spider_guard_Machine_Check_Attack03",
                DelayFrame          = 180,
            },

		},
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Spider_guard_Machine_walk.frm",
        Func            = "Spider_guard_Machine_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Spider_guard_Machine_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 20,
                AIFunc              = "Spider_guard_Machine_Check_Targeting",
                DelayFrame          = 60,
            },
            -- Ÿ������
            --{
            --    AICheckFrame        = 200,
            --    AIFunc              = "Spider_guard_Machine_Check_ReleaseTarget",
            --    DelayFrame          = 100,
            --},
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 25,
                AIFunc              = "Spider_guard_Machine_Check_TurnToTarget",
                DelayFrame          = 5,
            },
            -- ������
            {
                AICheckFrame        = 30,
                AIFunc              = "Spider_guard_Machine_Check_JumpUp",
                DelayFrame          = 20,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 30,
                AIFunc              = "Spider_guard_Machine_Check_JumpDown",
                DelayFrame          = 20,
            },
            -- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "Spider_guard_Machine_Check_Stop",
                DelayFrame          = 33,
            },
        }
    },
        
    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "Spider_guard_Machine_Attack01.frm",
        Func    = "Spider_guard_Machine_Attack01Func",
    },
    
    -- ��������2
    {
        ID      = "ATTACK02",
        Motion  = "Spider_guard_Machine_Attack02.frm",
        Func    = "Spider_guard_Machine_Attack02Func",
    },
    
    -- ��������3
    {
        ID      = "ATTACK03",
        Motion  = "Spider_guard_Machine_Attack03.frm",
        Func    = "Spider_guard_Machine_Attack03Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Spider_guard_Machine_Jump_Up.frm",
        Func    = "Spider_guard_Machine_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Spider_guard_Machine_Jump_Down.frm",
        Func    = "Spider_guard_Machine_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Spider_guard_Machine_Jump_Landing.frm",
        Func    = "Spider_guard_Machine_ToWait",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Spider_guard_Machine_Damage_Up.frm",
        Func    = "Spider_guard_Machine_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Spider_guard_Machine_Damage_Middle.frm",
        Func    = "Spider_guard_Machine_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Spider_guard_Machine_Damage_Down.frm",
        Func    = "Spider_guard_Machine_DamageFunc",
    },

    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Spider_guard_Machine_Die.frm",
        Func    = "Spider_guard_Machine_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
        
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Spider_guard_Machine_Stone.frm",
        Func    = "Spider_guard_Machine_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Spider_guard_Machine_Stone.frm",
        Func    = "Spider_guard_Machine_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Spider_guard_Machine_Stone.frm",
		Func	= "Spider_guard_Machine_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnSpider_guard_Machine_Land",
    Die     = "OnSpider_guard_Machine_Die",
    Damage  = "OnSpider_guard_Machine_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitSpider_guard_Machine( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_DOWN" )
    
    pMonster:AddTraceParticleToBone( "Machine_Steam", 1.0, 5, 8, 8, 0.0, 0.0, true )
    
    if( pMonster:GetGameMode() == GC_GM_QUEST44 ) then
		pMonster.Team = 0
    end
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Spider_guard_Machine_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    Spider_guard_Machine_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Spider_guard_Machine_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    if( iFrame == 51 or iFrame == 6 ) then
		pMonster:PlaySound(992015)
    end
    
    Spider_guard_Machine_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �ױ� ����
function Spider_guard_Machine_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(992014)
	elseif( iFrame == 43 ) then
	--[[
		pMonster:AddParticle( "Uden_Die_01", 0.0, 0.0 )
		local posx = -0.05
		local posy = 0.1
		
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Talin_Steam", 1.0, 7, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Talin_Steam_02", 1.0, 7, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Talin_Steam_03", 1.0, 9, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Talin_Steam_03", 1.0, 11, 8, 8, posx, posy )
		else
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Talin_Steam", 1.0, 7, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Talin_Steam_02", 1.0, 7, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Talin_Steam_03_R", 1.0, 9, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Talin_Steam_03_R", 1.0, 11, 8, 8, posx, posy, true )
		end
		--]]
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster(true)
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Spider_guard_Machine_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Spider_guard_Machine_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    Spider_guard_Machine_Smoke( iMonsterIndex, iFrame )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 60 ) then
		pMonster:AddDamage(DT_SPIDER_GUARD_DEMOLITION_LAY)
	elseif( iFrame == 63 ) then
		pMonster:PlaySound(992016)
		local posx = 0.26
		local posy = 0.35
		if (pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Spider_Machine_Beam_01", posx, posy)
			pMonster:AddParticleNoDirection("Spider_Machine_Beam_02", posx, posy)
			pMonster:AddParticleNoDirection("Spider_Machine_Beam_03", posx, posy)
			pMonster:AddParticleNoDirection("Spider_Machine_Beam_04", posx, posy)
			pMonster:AddParticleNoDirection("Spider_Machine_Beam_05", posx, posy)
			pMonster:AddParticleNoDirection("Spider_Machine_Beam_06", posx, posy)
		else
			pMonster:AddParticleNoDirection("Spider_Machine_Beam_01_R", -posx, posy)
			pMonster:AddParticleNoDirection("Spider_Machine_Beam_02_R", -posx, posy)
			pMonster:AddParticleNoDirection("Spider_Machine_Beam_03", -posx, posy)
			pMonster:AddParticleNoDirection("Spider_Machine_Beam_04_R", -posx, posy)
			pMonster:AddParticleNoDirection("Spider_Machine_Beam_05_R", -posx, posy)
			pMonster:AddParticleNoDirection("Spider_Machine_Beam_06_R", -posx, posy)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ��������2 ����
function Spider_guard_Machine_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    --Spider_guard_Machine_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 79 ) then
		pMonster:AddDamage( DT_SPIDER_GUARD_BOMB )
		pMonster:AddDamage( DT_SPIDER_GUARD_BOMB1 )
		pMonster:AddDamage( DT_SPIDER_GUARD_BOMB_R )
		pMonster:AddDamage( DT_SPIDER_GUARD_BOMB1_R )
	elseif( iFrame == 82 ) then
		pMonster:PlaySound(992018)
		pMonster:AddParticleNoDirection("Spider_Bomb_Shot", 0.0, 0.45)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function Spider_guard_Machine_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    --Spider_guard_Machine_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 45 ) then
		local posx = 0.1
		local posy = 0.05
		if( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
		end
		--pMonster:AddTraceParticleToBone( "Spider_Machine_Aim_01", 1.0, 3, 6, 6, posx, posy )
		--pMonster:AddTraceParticleToBone( "Spider_Machine_Aim_02", 1.0, 3, 6, 6, posx, posy )
		--pMonster:AddTraceParticleToBone( "Spider_Machine_Aim_03", 1.0, 3, 6, 6, posx, posy )
		pMonster:SetTarget( 0, -1200, 800, 1200, -800 )
		pMonster:AddDamageWithLocate( DT_SPIDER_GUARD_AIM_MARK, pMonster:GetTargetX(), pMonster:GetTargetY(), true )
	elseif( iFrame == 90 ) then
		local posx = 0.15
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Spider_Machine_Vulcan_Shot_01", 1.0, 32, 6, 6, posx + 0.07, 0.0 )
			pMonster:AddTraceParticleToBone( "Spider_Machine_Vulcan_Shot_02", 1.0, 32, 6, 6, posx + 0.07, 0.0 )
		else
			pMonster:AddParticleNoDirection( "Spider_Machine_Vulcan_Shot_01_R", -0.29, 0.35 )
			pMonster:AddTraceParticleToBone( "Spider_Machine_Vulcan_Shot_02", 1.0, 32, 8, 6, -posx - 0.07, 0.0 )
			pMonster:AddParticleNoDirection( "Spider_Machine_Vulcan_Shot_01_R", 0.0, 0.35 )
			pMonster:AddTraceParticleToBone( "Spider_Machine_Vulcan_Shot_02", 1.0, 33, 8, 6, -posx + 0.00, 0.0 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function Spider_guard_Machine_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame > 18 and pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
	
	if( iFrame == 18 ) then
		Spider_guard_Machine_Jump( iMonsterIndex )
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� �ٿ� ����
function Spider_guard_Machine_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    Spider_guard_Machine_Smoke( iMonsterIndex, iFrame )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function Spider_guard_Machine_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    Spider_guard_Machine_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame == 1 ) then
		pMonster:PlaySound(992015)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Spider_guard_Machine_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    Spider_guard_Machine_Smoke( iMonsterIndex, iFrame )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetInvincible( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function Spider_guard_Machine_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    Spider_guard_Machine_Smoke( iMonsterIndex, iFrame )
    
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
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function Spider_guard_Machine_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	Spider_guard_Machine_Smoke( iMonsterIndex, iFrame )
    
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
			pMonster:SetState( "DIE_LANDING" )
		end
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Spider_guard_Machine_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -600, 360, 600, -300 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function Spider_guard_Machine_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -800, 460, 800, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Spider_guard_Machine_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Spider_guard_Machine_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -350, 800, 350, -800 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Spider_guard_Machine_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -350, 800, 350, -800 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Spider_guard_Machine_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Spider_guard_Machine_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 50, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Spider_guard_Machine_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -400, 300, 400, -250 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Spider_guard_Machine_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 330, 300, -380 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Spider_guard_Machine_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 800, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Spider_guard_Machine_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, -100, 200, -800 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnSpider_guard_Machine_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnSpider_guard_Machine_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnSpider_guard_Machine_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK01" ) == false and pMonster:CheckState( "ATTACK02" ) == false and pMonster:CheckState( "ATTACK03" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK03" )
		end
	end

    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
	
	--if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
	--	if ( pMonster:FloatRand() < 0.2 and pMonster:GetIsContact() == true ) then
	--		pMonster:SetState( "ATTACK03" )
	--	end
	--end
end

function Spider_guard_Machine_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Spider_guard_Machine_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	--[[
	if( pMonster:GetIsContact() == true )then
		if( pMonster:GetIsRight() == true ) then
            pMonster:SetIsRight( false )
            pMonster:SetSpeedX( -pMonster:GetWalkSpeed() )        
        else
            pMonster:SetIsRight( true )
            pMonster:SetSpeedX( pMonster:GetWalkSpeed() )        
        end
	end
	--]]
	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.06) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.036 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.018 )		
		end
	end
end

function Spider_guard_Machine_Smoke( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( math.mod( iFrame, 100 ) == 1 ) then
		local posx = -0.05
		local posy = 0.1
		
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Talin_Steam", 1.0, 7, 8, 8, posx, posy +0.07 )
			--pMonster:AddTraceParticleToBone( "Talin_Steam_02", 1.0, 7, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Talin_Steam_03", 1.0, 9, 8, 8, posx -0.02, posy )
			pMonster:AddTraceParticleToBone( "Talin_Steam_03", 1.0, 11, 8, 8, posx -0.042, posy )
		else
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Talin_Steam", 1.0, 7, 8, 8, posx, posy +0.07, true )
			--pMonster:AddTraceParticleToBone( "Talin_Steam_02", 1.0, 7, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Talin_Steam_03_R", 1.0, 9, 8, 8, posx +0.02, posy, true )
			pMonster:AddTraceParticleToBone( "Talin_Steam_03_R", 1.0, 11, 8, 8, posx +0.042, posy, true )
		end
    end
end
