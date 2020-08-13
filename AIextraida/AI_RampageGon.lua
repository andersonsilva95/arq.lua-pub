-- AI_RampageGon.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Gon_Wait.frm",
        Func    = "RampageGon_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "RampageGon_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "RampageGon_Check_ReleaseTarget",
                DelayFrame          = 660,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "RampageGon_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- �̵�
            {
                AICheckFrame        = 75,
                AIFunc              = "RampageGon_Check_Walk",
                DelayFrame          = 110,
            },
            -- ����01
            {
                AICheckFrame        = 75,
                AIFunc              = "RampageGon_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 25,
                AIFunc              = "RampageGon_Check_RunAway",
                DelayFrame          = 55,
            },--[[
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "RampageGon_Check_HighJump",
                DelayFrame          = 55,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "RampageGon_Check_JumpDown",
                DelayFrame          = 0,
            },--]]
            -- ������(�̵�)
            {
                AICheckFrame        = 110,
                AIFunc              = "RampageGon_Check_Idle",
                DelayFrame          = 110,
            },
        }
    },

    -- ������
    {
        ID      = "IDLE",
        Motion  = "Gon_Wait.frm",
        Func    = "RampageGon_IdleFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 55,
                AIFunc              = "RampageGon_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ������(����)
            {
                AICheckFrame        = 440,
                AIFunc              = "RampageGon_Check_Idle_Stop",
                DelayFrame          = 440,
            },
        }
    },
    
    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Gon_Walk.frm",
        Func    = "RampageGon_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "RampageGon_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 55,
                AIFunc              = "RampageGon_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "RampageGon_Check_ReleaseTarget",
                DelayFrame          = 660,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "RampageGon_Check_TurnToTarget",
                DelayFrame          = 35,
            },
             -- ����
            {
                AICheckFrame        = 10,
                AIFunc              = "RampageGon_Check_WalkStop",
                DelayFrame          = 10,
            },
        }
    },
    
    -- ����01
    {
        ID      = "ATTACK01",
        Motion  = "Gon_Attack01.frm",
        Func    = "RampageGon_Attack01Func",
    },
    
    -- ��������
    {
        ID      = "RUNAWAY",
        Motion  = "Gon_Walk.frm",
        Func    = "RampageGon_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "RampageGon_RunAwayMoveFail",


        Trigger =
        {
             -- ����
            {
                AICheckFrame        = 10,
                AIFunc              = "RampageGon_Check_RunAwayStop",
                DelayFrame          = 10,
            },
        }
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Gon_Jump.frm",
        Func    = "RampageGon_JumpFunc",
    },

    -- ��������
    {
        ID      = "HIGHJUMP",
        Motion  = "Gon_Jump.frm",
        Func    = "RampageGon_HighJumpFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Gon_Damage_Up.frm",
        Func    = "RampageGon_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Gon_Damage_Middle.frm",
        Func    = "RampageGon_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Gon_Damage_Down.frm",
        Func    = "RampageGon_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "Gon_Down_Up01.frm",
        Func    = "RampageGon_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "RampageGon_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Gon_Down_Up02.frm",
        Func    = "RampageGon_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Gon_Down_Up03.frm",
        Func    = "RampageGon_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "RampageGon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Gon_Down_Middle.frm",
        Func    = "RampageGon_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "RampageGon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "Gon_Down_Down.frm",
        Func    = "RampageGon_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "RampageGon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Gon_Down_Special.frm",
        Func    = "RampageGon_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Gon_Down_Special_Landing.frm",
        Func    = "RampageGon_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "RampageGon_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Gon_Die01.frm",
        Func    = "RampageGon_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Gon_Die02.frm",
        Func    = "RampageGon_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },

    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Gon_Standup.frm",
        Func    = "RampageGon_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Gon_Stone.frm",
        Func    = "RampageGon_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Gon_Stone.frm",
        Func    = "RampageGon_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Gon_Stone.frm",
		Func	= "RampageGon_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnRampageGon_Land",
    Die     = "OnRampageGon_Die",
    Damage  = "OnRampageGon_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitRampageGon( iMonsterIndex )
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
function RampageGon_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetSpeedX( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
    

end

-- ������ ����
function RampageGon_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    --pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
    
end

-- �޸��� ����
function RampageGon_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed())
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end

end

-- �״»���
function RampageGon_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LANDING" )
    end
end

-- �״»��� ����
function RampageGon_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function RampageGon_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function RampageGon_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function RampageGon_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ�
function RampageGon_DownFunc( iMonsterIndex, iFrame )
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

-- �ٿ� �ٿ�
function RampageGon_DownDownFunc( iMonsterIndex, iFrame )
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
function RampageGon_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function RampageGon_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function RampageGon_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 21 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  ���� ����
function RampageGon_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame == 10 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.0 ) -- Ÿ�������� ������ ���
		pMonster:PlaySound(346)
	elseif( iFrame == 70 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_GON01, pMonster:GetAngleToTarget() )
		pMonster:PlaySound(348)
	elseif( iFrame == 109 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_GON01, pMonster:GetAngleToTarget() )
		pMonster:PlaySound(348)
	elseif( iFrame == 149 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_GON01, pMonster:GetAngleToTarget() )
		pMonster:PlaySound(348)
	elseif( iFrame == 187 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_GON01, pMonster:GetAngleToTarget() )
		pMonster:PlaySound(348)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function RampageGon_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end

end

--  �������� ����
function RampageGon_HighJumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function RampageGon_StoneCurseFunc( iMonsterIndex, iFrame )
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
function RampageGon_IceCurseFunc( iMonsterIndex, iFrame )
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
function RampageGon_HoldFunc( iMonsterIndex, iFrame )
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

function RampageGon_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -200 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function RampageGon_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 300, -300, 150, 300, -250 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function RampageGon_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function RampageGon_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 500, -100, 150, 100, -250 ) == true ) then
			pMonster:TurnToTarget()
            pMonster:SetState( "WALK" )
            pMonster:ResetDelay()
    end
end

function RampageGon_Check_RunAway( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -300, 250, 300, -250 ) == true ) then
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

function RampageGon_Check_WalkStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 200, -150, 200, 150, -200 ) == true ) then
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function RampageGon_Check_RunAwayStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -400, 250, 400, -250 ) == false ) then
    	pMonster:TurnToTarget()
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function RampageGon_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function RampageGon_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -100, 150, 100, -250 ) == true or pMonster:CheckTargetInRange( 300, -200, 100, 200, -150 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function RampageGon_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 300, 100, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		RampageGon_Jump( iMonsterIndex )
		pMonster:SetState( "HIGHJUMP" )
		pMonster:ResetDelay()
    end
end

function RampageGon_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, -40, 100, -200 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function RampageGon_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..
function RampageGon_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
		pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function RampageGon_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnRampageGon_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )

    if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end
end

function OnRampageGon_Die( iMonsterIndex )
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

function OnRampageGon_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	--pMonster:AddCountValue(1)
    
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

function RampageGon_Jump( iMonsterIndex )
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

function RampageGon_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

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

function RampageGon_RunAwayMoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:FloatRand() < 0.5 or pMonster:CheckTargetInRange( 0, -150, -40, 150, -1000 ) == true or pMonster:CheckTargetInRange( 0, -150, 1000, 150, 60 ) == true ) then
			pMonster:SetNoCheckContact(27)	
			pMonster:SetIgnoreFHCheck(true)		
			pMonster:SetState( "JUMP" )
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )	
			if( pMonster:GetY() < 0.8 ) then
				pMonster:SetSpeedY( 0.042 )
			elseif( pMonster:GetY() > 1.2 ) then
				pMonster:SetSpeedY( 0.005 )	
			else
				if( pMonster:FloatRand() < 0.5 ) then
					pMonster:SetSpeedY( 0.042 )
				else
					pMonster:SetSpeedY( 0.005 )	
				end
			end
		else
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK01" )	
		end
	end
end

function RampageGon_IdleMoveFail( iMonsterIndex )
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