-- AI_Victor2.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Victor2_Wait.frm",
        Func    = "Victor2_WaitFunc",

        Trigger =
        {

			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Victor2_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 40,
                AIFunc              = "Victor2_Check_TurnToTarget",
                DelayFrame          = 50,
            },

            -- �ȱ�
            {
                AICheckFrame        = 75,
                AIFunc              = "Victor2_Check_Walk",
                DelayFrame          = 110,
            },

            {
                AICheckFrame        = 50,
                AIFunc              = "Victor2_Check_Attack01",
                DelayFrame          = 150,
            },

            {
                AICheckFrame        = 90,
                AIFunc              = "Victor2_Check_Attack02",
                DelayFrame          = 270,
            },

            {
                AICheckFrame        = 70,
                AIFunc              = "Victor2_Check_Attack03",
                DelayFrame          = 210,
            },

            -- ��������
			{
				AICheckFrame		= 55,
				AIFunc				= "Victor2_Check_JumpUp",
				DelayFrame			= 75,
			},
			-- �����ٿ�
			{
				AICheckFrame		= 80,
				AIFunc				= "Victor2_Check_JumpDown",
				DelayFrame			= 85,
			},
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Victor2_Walk.frm",
        Func    = "Victor2_WalkFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Victor2_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Victor2_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- ��������
			{
				AICheckFrame		= 55,
				AIFunc				= "Victor2_Check_JumpUp",
				DelayFrame			= 75,
			},
			-- �����ٿ�
			{
				AICheckFrame		= 80,
				AIFunc				= "Victor2_Check_JumpDown",
				DelayFrame			= 85,
			},
			-- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "Victor2_Check_Attack01",
                DelayFrame          = 95,
            },
            -- ���߱�
            {
                AICheckFrame        = 5,
                AIFunc              = "Victor2_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- �ȱ� ����
    {
        ID      = "ATTACK01",
        Motion  = "Victor2_Attack01.frm",
        Func    = "Victor2_Attack01Func",
    },
    
    -- �ݰ�
    {
        ID      = "ATTACK03",
        Motion  = "Victor2_Attack03.frm",
        Func    = "Victor2_Attack03Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK02",
        Motion  = "Victor2_Attack02_Start.frm",
        Func    = "Victor2_Attack02Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK02_ATK_R",
        Motion  = "Victor2_Attack02_A.frm",
        Func    = "Victor2_Attack02AtkRFunc",
    },
    
    -- ��������
    {
        ID      = "ATTACK02_ATK_L",
        Motion  = "Victor2_Attack02_A.frm",
        Func    = "Victor2_Attack02AtkLFunc",
    },
    
    -- ��������
    {
        ID      = "ATTACK02_LANDING_R",
        Motion  = "Victor2_Attack02_A_Landing.frm",
        Func    = "Victor2_Attack02LandingRFunc",
    },
    
    -- ��������
    {
        ID      = "ATTACK02_LANDING_L",
        Motion  = "Victor2_Attack02_A_Landing.frm",
        Func    = "Victor2_Attack02LandingLFunc",
    },

    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Victor2_Die.frm",
        Func    = "Victor2_DieFunc",
    },
    
    {
        ID      = "REGEN",
        Motion  = "Victor_Next.frm",
        Func    = "Victor2_RegenFunc",
    },
    
    {
        ID      = "WAIT_DRAMA",
        Motion  = "Victor2_Wait.frm",
        Func    = "Victor2_WaitDramaFunc",
    },
    
    -- ����
	{
		ID	  = "JUMP",
		Motion  = "Victor2_Jump.frm",
		Func	= "Victor2_JumpFunc",
	},

	-- ����
	{
		ID	  = "LANDING",
		Motion  = "Victor2_Jump_Landing.frm",
		Func	= "Victor2_LandingFunc",
	},
}

CallBack =
{
    Land    = "OnVictor2_Land",
    --Die     = "OnVictor2_Die",
    Damage  = "OnVictor2_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitVictor2( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Victor2_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- ��� ����
function Victor2_WaitDramaFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT_DRAMA" )        
    end
end

-- �ȱ� ����
function Victor2_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
    if( iFrame == 53 ) then
		--pMonster:PlaySound( 998008 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		--pMonster:PlaySound( 998008 )
        pMonster:SetState( "WALK" )
    end
end

-- ���� ����
function Victor2_JumpFuncUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

-- ���� ����
function Victor2_JumpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

-- ���� ����
function Victor2_LandingFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState("WAIT")
	end
end

-- �״»���
function Victor2_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetHP(0.1)
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(997006)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
        pMonster:EndMonster()
    end
end

-- ������ ������
function Victor2_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ������ ������
function Victor2_DamageDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:SetPushCheck( true )
    end
end

--  ����
function Victor2_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 67 ) then
    	pMonster:PlaySound(997004)
    	pMonster:AddDamage(DT_VICTOR2_ATK1)
    	local posx = 0.4
        local posy = 0.3
        if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Victor_Fullswing_01", posx,posy  )
			pMonster:AddParticle( "Victor_Fullswing_02", posx,posy  )
			pMonster:AddParticle( "Victor_Fullswing_03", posx,posy  )
			pMonster:AddParticle( "Victor_Fullswing_04", posx,posy  )
			pMonster:AddParticle( "Victor_Fullswing_05", posx,posy  )
			pMonster:AddParticle( "Victor_Fullswing_06", posx,posy  )
			pMonster:AddParticle( "Victor_Fullswing_07", posx,posy  )
		else
			pMonster:AddParticleNoDirection( "Victor_Fullswing_01_R", -posx,posy  )
			pMonster:AddParticleNoDirection( "Victor_Fullswing_02_R", -posx,posy  )
			pMonster:AddParticleNoDirection( "Victor_Fullswing_03", -posx,posy  )
			pMonster:AddParticleNoDirection( "Victor_Fullswing_04", -posx,posy  )
			pMonster:AddParticleNoDirection( "Victor_Fullswing_05", -posx,posy  )
			pMonster:AddParticleNoDirection( "Victor_Fullswing_06", -posx,posy  )
			pMonster:AddParticleNoDirection( "Victor_Fullswing_07_R", -posx,posy  )
		end
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���󰡱�~
function Victor2_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == pMonster:GetLastFrame() - 8 ) then
        pMonster:SkillReadyEffectNoStop(130,50,130)
   	elseif( iFrame >= pMonster:GetLastFrame() ) then
   		if( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK02_ATK_L" )
		else
			pMonster:SetState( "ATTACK02_ATK_R" )
		end
    end
end

local intervalX = 0
local intervalY = 0
local processFrame = 35

-- �����ʿ��� ����!
function Victor2_Attack02AtkRFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( intervalX == 0 ) then
		intervalX = ( ( pMonster:GetStageX() - 0.4 ) - pMonster:GetX() ) / processFrame
    end
    
    if( intervalY == 0 ) then
		intervalY = ( 2.0 - pMonster:GetY() ) / processFrame
    end
    
    if( iFrame <= processFrame ) then
		pMonster:SetSpeedX(intervalX)
		pMonster:SetSpeedY(intervalY)
	elseif( iFrame == processFrame + 1 ) then
		pMonster:SetSpeedX(0)
		pMonster:SetSpeedY(0)
	elseif( iFrame >= 95 ) then
		pMonster:SetSpeedY(-0.05)
		pMonster:SetFly(false)
		pMonster:SetNoCheckContact(10)
    end
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:SetFly(true)
        pMonster:SetPushCheck( false )
        pMonster:SetIsRight(true)
		intervalX = 0
		intervalY = 0
    elseif( iFrame == 57 ) then
		pMonster:PlaySound(997005)
		pMonster:AddDamageWithLocate( DT_VICTOR2_DARK_TONADO, pMonster:GetStageX(), 0.0, true)
   	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFly(false)
        pMonster:SetPushCheck( true )
        pMonster:SetFrameLock( true )
        intervalX = 0
        intervalY = 0
    end
end

-- ���ʿ��� ����!
function Victor2_Attack02AtkLFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( intervalX == 0 ) then
		intervalX = -( pMonster:GetX() - 0.4 ) / processFrame
    end
    
    if( intervalY == 0 ) then
		intervalY = ( 2.0 - pMonster:GetY() ) / processFrame
    end
    
    if( iFrame <= processFrame ) then
		pMonster:SetSpeedX(intervalX)
		pMonster:SetSpeedY(intervalY)
	elseif( iFrame == processFrame + 1 ) then
		pMonster:SetSpeedX(0)
		pMonster:SetSpeedY(0)
	elseif( iFrame >= 95 ) then
		pMonster:SetSpeedY(-0.05)
		pMonster:SetFly(false)
		pMonster:SetNoCheckContact(10)
    end
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:SetFly(true)
        pMonster:SetPushCheck( false )
        pMonster:SetIsRight(false)
		intervalX = 0
		intervalY = 0
    elseif( iFrame == 57 ) then
		pMonster:PlaySound(997005)
		pMonster:AddDamageWithLocate( DT_VICTOR2_DARK_TONADO_L, 0.0, 0.0, true)
   	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFly(false)
        pMonster:SetPushCheck( true )
        pMonster:SetFrameLock( true )
        intervalX = 0
        intervalY = 0
    end
end

-- �����ʿ��� ����!
function Victor2_Attack02LandingRFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:SetIsRight(false)
    end
end

-- ���ʿ��� ����!
function Victor2_Attack02LandingLFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:SetIsRight(true)
    end
end

--  ��ǳ
function Victor2_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 75 ) then
		pMonster:PlaySound(997003)
		pMonster:ComputeAngleToTarget( 0.3, 0.27 ) -- Ÿ�������� ������ ���
		angle = pMonster:GetAngleToTarget()
		if( ( pMonster:GetX() > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
		    ( pMonster:GetX() < pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
			angle = angle * -1.0 + 3.141592
		end
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02", 0.2,0.4)
		else
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, -angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02_R", -0.2,0.4)
		end
	elseif( iFrame == 87 ) then
		pMonster:PlaySound(997003)
		pMonster:ComputeAngleToTarget( 0.3, 0.27 ) -- Ÿ�������� ������ ���
		angle = pMonster:GetAngleToTarget()
		if( ( pMonster:GetX() > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
		    ( pMonster:GetX() < pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
			angle = angle * -1.0 + 3.141592
		end
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02", 0.2,0.4)
		else
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, -angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02_R", -0.2,0.4)
		end
	elseif( iFrame == 103 ) then
		pMonster:PlaySound(997003)
		pMonster:ComputeAngleToTarget( 0.3, 0.27 ) -- Ÿ�������� ������ ���
		angle = pMonster:GetAngleToTarget()
		if( ( pMonster:GetX() > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
		    ( pMonster:GetX() < pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
			angle = angle * -1.0 + 3.141592
		end
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02", 0.2,0.4)
		else
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, -angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02_R", -0.2,0.4)
		end
	elseif( iFrame == 116 ) then
		pMonster:PlaySound(997003)
		pMonster:ComputeAngleToTarget( 0.3, 0.27 ) -- Ÿ�������� ������ ���
		angle = pMonster:GetAngleToTarget()
		if( ( pMonster:GetX() > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
		    ( pMonster:GetX() < pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
			angle = angle * -1.0 + 3.141592
		end
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02", 0.2,0.4)
		else
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, -angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02_R", -0.2,0.4)
		end
	elseif( iFrame == 131 ) then
		pMonster:PlaySound(997003)
		pMonster:ComputeAngleToTarget( 0.3, 0.27 ) -- Ÿ�������� ������ ���
		angle = pMonster:GetAngleToTarget()
		if( ( pMonster:GetX() > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
		    ( pMonster:GetX() < pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
			angle = angle * -1.0 + 3.141592
		end
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02", 0.2,0.4)
		else
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, -angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02_R", -0.2,0.4)
		end
	elseif( iFrame == 145 ) then
		pMonster:PlaySound(997003)
		pMonster:ComputeAngleToTarget( 0.3, 0.27 ) -- Ÿ�������� ������ ���
		angle = pMonster:GetAngleToTarget()
		if( ( pMonster:GetX() > pMonster:GetTargetX() and pMonster:GetIsRight() ) or
		    ( pMonster:GetX() < pMonster:GetTargetX() and not pMonster:GetIsRight() ) ) then
			angle = angle * -1.0 + 3.141592
		end
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02", 0.2,0.4)
		else
			pMonster:AddDamageWithLocateAngle( DT_VICTOR_HADOKEN, 0.0, 0.0, false, -angle )
            pMonster:AddParticleNoDirection( "Victor_Hadoken_Start_02_R", -0.2,0.4)
		end
   	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ��ä��� ~ ������ ����!
function Victor2_RegenFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= 40 and iFrame < pMonster:GetLastFrame() ) then
		pMonster:SetHP( pMonster:GetHP() + pMonster:GetMaxHP() * 0.05 )
	end

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetIsRight( false )
	elseif( iFrame == 30 ) then
		local posX = 0.0
        local posY = 0.3
		pMonster:AddParticle( "Victor_Change_01", posX,posY)
		pMonster:AddParticle( "Victor_Change_02", posX,posY)
		pMonster:AddParticle( "Victor_Change_03", posX,posY)
		pMonster:AddParticle( "Victor_Change_04", posX,posY)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
        pMonster:SetHP( pMonster:GetHP() + pMonster:GetMaxHP() * 0.05 )
    end
end
-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Victor2_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 400, -900, 500, 900, -400 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Victor2_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Victor2_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Victor2_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Victor2_Check_JumpUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 300, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Victor2_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

function Victor2_Check_JumpDown( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

   if( pMonster:CheckTargetInRange( 30, -400, -40, 400, -1000 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetSpeedY( 0.01 )			
		pMonster:SetState( "JUMP" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

function Victor2_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 170, -170, 180, 170, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Victor2_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    --if( pMonster:IsTarget() == true ) then
	if( pMonster:GetTargetIsContact() and pMonster:CheckTargetInRange( 0, -1536, 600, 1536, -500 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
		pMonster:SetSuperArmor(true)
    end
end

function Victor2_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    --if( pMonster:IsTarget() == true ) then
	if( pMonster:CheckTargetInRange( 400, -400, 500, 400, -400 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnVictor2_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "LANDING" )
    end
    
    print("???")
    if( pMonster:CheckState( "ATTACK02_ATK_R" ) == true ) then
		print("???")
		pMonster:SetState( "ATTACK02_LANDING_R" )
    end
    
    if( pMonster:CheckState( "ATTACK02_ATK_L" ) == true ) then
		pMonster:SetState( "ATTACK02_LANDING_L" )
    end
	
	--if( pMonster:GetHP() <= 0 ) then
		--pMonster:SetState( "DIE" )
	--end
end

function OnVictor2_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:TurnToTarget()
	pMonster:SetState( "DIE" )
end

function OnVictor2_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	   
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	if ( pMonster:FloatRand() < 0.1 and pMonster:IsSuperArmor() == false and pMonster:CheckState("DOWN") == false ) then
		pMonster:SetSuperArmor(true)
		pMonster:TurnToTarget()
		if ( pMonster:FloatRand() < 0.75 ) then
			pMonster:SetState( "ATTACK03" )
		else
			pMonster:SetState( "ATTACK02" )
		end
	end
end

function Victor2_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	 
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.8) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:SetIgnoreFHCheck(true)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end
