-- AI_DrakeWorm.lua

ActionList =
{
	-- ���
	{
		ID	  = "WAIT",
		Motion  = "DrakeWorm_Wait.frm",
		Func	= "DrakeWorm_WaitFunc",

		Trigger =
		{

			-- ���󰡱�~
			{
				AICheckFrame		= 120,
				AIFunc				= "DrakeWorm_Check_Attack01",
				DelayFrame			= 160,
			},

			-- ȭ���ٴ�~
			{
				AICheckFrame		= 150,
				AIFunc				= "DrakeWorm_Check_Attack02",
				DelayFrame			= 600,
			},

			-- ����~
			{
				AICheckFrame		= 220,
				AIFunc				= "DrakeWorm_Check_Attack03",
				DelayFrame			= 500,
			},

			-- ������ �ķ�ġ��~
			{
				AICheckFrame		= 55,
				AIFunc				= "DrakeWorm_Check_Attack04",
				DelayFrame			= 200,
			},

		},
	},

	-- �̵�
	{
		ID	  = "WALK",
		Motion  = "DrakeWorm_Move.frm",
		Func	= "DrakeWorm_WalkFunc",

		Trigger =
		{
			-- Ÿ���� ���� ��
			{
				AICheckFrame		= 75,
				AIFunc				= "DrakeWorm_Check_TurnToTarget",
				DelayFrame			= 75,
			},
			-- ���߱�
			{
				AICheckFrame		= 10,
				AIFunc			= "DrakeWorm_Check_RunStop",
				DelayFrame		= 55,
			},
		},
	},
	
	-- ��
	{
		ID	  = "TURN",
		Motion  = "DrakeWorm_Turn.frm",
		Func	= "DrakeWorm_TurnFunc",
	},

	-- �ױ�
	{
		ID	  = "DIE",
		Motion  = "DrakeWorm_Die.frm",
		Func	= "DrakeWorm_DieFunc",
	},
	
	-- ���󰡱�!
	{
		ID	  = "ATTACK01",
		Motion  = "DrakeWorm_Attack01_Start.frm",
		Func	= "DrakeWorm_AttackStartFunc",
	},
	{
		ID	  = "ATTACK01_UP_R",
		Motion  = "DrakeWorm_Attack01_B.frm",
		Func	= "DrakeWorm_AttackUpRFunc",
	},
	{
		ID	  = "ATTACK01_UP_L",
		Motion  = "DrakeWorm_Attack01_B.frm",
		Func	= "DrakeWorm_AttackUpLFunc",
	},
	{
		ID	  = "ATTACK01_DOWN_R",
		Motion  = "DrakeWorm_Attack01_A.frm",
		Func	= "DrakeWorm_AttackDownRFunc",
	},
	{
		ID	  = "ATTACK01_DOWN_L",
		Motion  = "DrakeWorm_Attack01_A.frm",
		Func	= "DrakeWorm_AttackDownLFunc",
	},
	{
		ID	  = "ATTACK01_SIDE_R",
		Motion  = "DrakeWorm_Attack01_C.frm",
		Func	= "DrakeWorm_AttackSideRFunc",
	},
	{
		ID	  = "ATTACK01_SIDE_L",
		Motion  = "DrakeWorm_Attack01_C.frm",
		Func	= "DrakeWorm_AttackSideLFunc",
	},
	
	-- ȭ���ٴ�!
	{
		ID	  = "ATTACK02",
		Motion  = "DrakeWorm_Attack02_B.frm",
		Func	= "DrakeWorm_Attack02Func",
	},
	
	-- ȭ���ٴ�!
	{
		ID	  = "ATTACK02_LONG",
		Motion  = "DrakeWorm_Attack02_A.frm",
		Func	= "DrakeWorm_Attack02LongFunc",
	},
	
	-- ����!
	{
		ID	  = "ATTACK03",
		Motion  = "DrakeWorm_Attack03.frm",
		Func	= "DrakeWorm_Attack03Func",
	},
	
	-- ������ �ķ�ġ��!
	{
		ID	  = "ATTACK04",
		Motion  = "DrakeWorm_Attack04.frm",
		Func	= "DrakeWorm_Attack04Func",
	},
}

CallBack =
{
	Die	 = "OnDrakeWorm_Die",
	Damage = "OnDrakeWorm_Damage"
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitDrakeWorm( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function DrakeWorm_WaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	g_kCamera.WideMode = 7
	--pMonster:SetX( 0.0 )
	--pMonster:SetY( 2.0 )
	pMonster:SetPushCheck( true )
	pMonster:SetIgnoreFHCheck( true )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- �ȱ� ����
function DrakeWorm_WalkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WALK" )
	end
end

-- �� ����
function DrakeWorm_TurnFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetIsRight( not pMonster:GetIsRight() )
		pMonster:SetState( "WAIT" )
	end
end

-- �״»���
function DrakeWorm_DieFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(998047)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()		
	end
end

-- ���󰡱�!
function DrakeWorm_AttackStartFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--[[
	if( iFrame >= 30 and iFrame < pMonster:GetLastFrame() ) then
		if( math.mod(iFrame, 5) == 0 ) then
			for i = 0, 10 do
				pMonster:StartAttack( 1, PAR_BIG_DAMAGE, 1.0, 25-(i*2), 25-(i*2), 5)
			end
		elseif( math.mod(iFrame, 5) == 4 ) then
			pMonster:EndAttack()
		end
	end
	--]]

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:SetFly(true)
		pMonster:SetPushCheck( false )
		pMonster:SetIgnoreFHCheck( false )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(998002)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		
		-- �̷��� �ִµ� �������� �ѷ��� �ɰ� ���� ����?;;
		-- side_R_HIGH & LOW�� ���� �������� ������ �� 
		
		--pMonster:SetState( "ATTACK01_DOWN_R" )
		--pMonster:SetState( "ATTACK01_DOWN_L" )
		--pMonster:SetState( "ATTACK01_UP_R" )
		--pMonster:SetState( "ATTACK01_UP_L" )
		--pMonster:SetState( "ATTACK01_SIDE_R" )
		--pMonster:SetState( "ATTACK01_SIDE_L" )

		if ( pMonster:FloatRand() < 0.21 ) then
			pMonster:SetState( "ATTACK01_SIDE_R" )
		elseif ( pMonster:FloatRand() < 0.25 ) then
			pMonster:SetState( "ATTACK01_SIDE_L" )
		elseif ( pMonster:FloatRand() < 0.25 ) then
			pMonster:SetState( "ATTACK01_UP_R" )
		elseif ( pMonster:FloatRand() < 0.33 ) then
			pMonster:SetState( "ATTACK01_UP_L" )
		elseif ( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK01_DOWN_R" )
		else
			pMonster:SetState( "ATTACK01_DOWN_L" )
		end

	end
end

-- ������ ~
function DrakeWorm_AttackDownRFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 30 ) then
		if( math.mod(iFrame, 5) == 0 ) then
			for i = 0, 10 do
				pMonster:StartAttack( 1, PAR_BIG_DAMAGE, 1.0, 25-(i*2), 25-(i*2), 5)

				if( iFrame == 10 or iFrame == 20 or iFrame == 30 ) then
					pMonster:StartAttack( 1, PAR_DOWN, 1.0, 25-(i*2), 25-(i*2), 5)
				end
			end
		elseif( math.mod(iFrame, 5) == 4 ) then
			pMonster:EndAttack()
		end
	end

	if( iFrame <= 1 ) then
		pMonster:SetFly( true )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( false )
		pMonster:SetY(0.4)
		pMonster:SetX(4.3)
		pMonster:SetIsRight(false)
	elseif( iFrame == 5 ) then
		pMonster:PlaySound(998003)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetFly( false )
	end
end

-- ������ ~
function DrakeWorm_AttackDownLFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 30 ) then
		if( math.mod(iFrame, 5) == 0 ) then
			for i = 0, 10 do
				pMonster:StartAttack( 1, PAR_BIG_DAMAGE, 1.0, 25-(i*2), 25-(i*2), 5)

				if( iFrame == 10 or iFrame == 20 or iFrame == 30 ) then
					pMonster:StartAttack( 1, PAR_DOWN, 1.0, 25-(i*2), 25-(i*2), 5)
				end
			end
		elseif( math.mod(iFrame, 5) == 4 ) then
			pMonster:EndAttack()
		end
	end

	if( iFrame <= 1 ) then
		pMonster:SetFly( true )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( false )
		pMonster:SetY(0.4)
		pMonster:SetX(0.0)
		pMonster:SetIsRight(true)
	elseif( iFrame == 5 ) then
		pMonster:PlaySound(998003)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetFly( false )
	end
end

-- �Ʒ����� ~
function DrakeWorm_AttackUpRFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 30 ) then
		if( math.mod(iFrame, 5) == 0 ) then
			for i = 0, 10 do
				pMonster:StartAttack( 1, PAR_BIG_DAMAGE, 1.0, 25-(i*2), 25-(i*2), 5)

				if( iFrame == 10 or iFrame == 20 or iFrame == 30 ) then
					pMonster:StartAttack( 1, PAR_DOWN, 1.0, 25-(i*2), 25-(i*2), 5)
				end
			end
		elseif( math.mod(iFrame, 5) == 4 ) then
			pMonster:EndAttack()
		end
	end
	
	if( iFrame <= 1 ) then
		pMonster:SetFly( true )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( false )
		
		pMonster:SetY(0.4)
		pMonster:SetX(2.8)
		pMonster:SetIsRight(false)
	elseif( iFrame == 5 ) then
		pMonster:PlaySound(998003)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetFly( false )
	end
end

-- �Ʒ����� ~
function DrakeWorm_AttackUpLFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 30 ) then
		if( math.mod(iFrame, 5) == 0 ) then
			for i = 0, 10 do
				pMonster:StartAttack( 1, PAR_BIG_DAMAGE, 1.0, 25-(i*2), 25-(i*2), 5)

				if( iFrame == 10 or iFrame == 20 or iFrame == 30 ) then
					pMonster:StartAttack( 1, PAR_DOWN, 1.0, 25-(i*2), 25-(i*2), 5)
				end
			end
		elseif( math.mod(iFrame, 5) == 4 ) then
			pMonster:EndAttack()
		end
	end
	
	if( iFrame <= 1 ) then
		pMonster:SetFly( true )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( false )
		
		pMonster:SetY(0.4)
		pMonster:SetX(1.5)
		pMonster:SetIsRight(true)
	elseif( iFrame == 5 ) then
		pMonster:PlaySound(998003)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetFly( false )
	end
end

-- �����ʿ��� ~
function DrakeWorm_AttackSideRFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 30 ) then
		pMonster:SetY(1.15)
		if( math.mod(iFrame, 5) == 0 ) then
			for i = 0, 10 do
				pMonster:StartAttack( 1, PAR_BIG_DAMAGE, 1.0, 25-(i*2), 25-(i*2), 5)

				if( iFrame == 10 or iFrame == 20 or iFrame == 30 ) then
					pMonster:StartAttack( 1, PAR_DOWN, 1.0, 25-(i*2), 25-(i*2), 5)
				end
			end
		elseif( math.mod(iFrame, 5) == 4 ) then
			pMonster:EndAttack()
		end
	end

	if( iFrame <= 42 ) then
		pMonster:SetSpeedX(-0.2)
	else
		pMonster:SetSpeedX(0.0)
		--pMonster:SetSpeedY(-0.005)
	end

	if( iFrame <= 1 ) then
		pMonster:SetFly( true )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( false )
		pMonster:SetIsRight(false)
		
		pMonster:SetX(9.5)
		pMonster:SetY(0.8)
		pMonster:SetIsRight(false)
	elseif( iFrame == 5 ) then
		pMonster:PlaySound(998003)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "TURN" )
		pMonster:SetNoCheckContact( 50 )
		pMonster:SetFly( false )
	end
end

-- ���ʿ��� ~
function DrakeWorm_AttackSideLFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 30 ) then
		pMonster:SetY(1.15)
		if( math.mod(iFrame, 5) == 0 ) then
			for i = 0, 10 do
				pMonster:StartAttack( 1, PAR_BIG_DAMAGE, 1.0, 25-(i*2), 25-(i*2), 5)

				if( iFrame == 10 or iFrame == 20 or iFrame == 30 ) then
					pMonster:StartAttack( 1, PAR_DOWN, 1.0, 25-(i*2), 25-(i*2), 5)
				end
			end
		elseif( math.mod(iFrame, 5) == 4 ) then
			pMonster:EndAttack()
		end
	end
	
	if( iFrame <= 42 ) then
		pMonster:SetSpeedX(0.2)
	else
		pMonster:SetSpeedX(0.0)
	end
	
	if( iFrame <= 1 ) then
		pMonster:SetFly( true )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( false )
		pMonster:SetIsRight( true )
		
		pMonster:SetX(-5.0)
		pMonster:SetY(0.8)
		pMonster:SetIsRight(true)
	elseif( iFrame == 5 ) then
		pMonster:PlaySound(998003)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "TURN" )
		pMonster:SetNoCheckContact( 50 )
		pMonster:SetFly( false )
	end
end

-- ȭ���ٴ�
function DrakeWorm_Attack02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		--pMonster:SetFly( true )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( true )
	elseif( iFrame == 57 ) then
		pMonster:PlaySound( 998004 )
		pMonster:PlaySound( 998005 )
		pMonster:AddDamage(DT_DRAKEWORM_FLAME_BREATH_SHORT)
	elseif( iFrame == 60 ) then
		pMonster:AddTraceParticleToBone( "Drakeworm_Flame_01", 1.0, 29, 0, 0, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Drakeworm_Flame_02", 1.0, 29, 0, 0, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Drakeworm_Flame_03", 1.0, 29, 0, 0, 0.0, 0.0 )
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Drakeworm_Flame_04", 1.0, 29, 0, 0, 0.0, 0.0 )
		else
			pMonster:AddTraceParticleToBone( "Drakeworm_Flame_04_R", 1.0, 29, 0, 0, 0.0, 0.0 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- ȭ���ٴ�
function DrakeWorm_Attack02LongFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		--pMonster:SetFly( true )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( true )
	elseif( iFrame == 57 ) then
		pMonster:PlaySound( 998004 )
		pMonster:PlaySound( 998005 )
		pMonster:AddDamage(DT_DRAKEWORM_FLAME_BREATH)
	elseif( iFrame == 60 ) then
		pMonster:AddTraceParticleToBone( "Drakeworm_Flame_01", 1.0, 29, 0, 0, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Drakeworm_Flame_02", 1.0, 29, 0, 0, 0.0, 0.0 )
		pMonster:AddTraceParticleToBone( "Drakeworm_Flame_03", 1.0, 29, 0, 0, 0.0, 0.0 )
		if( pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Drakeworm_Flame_04", 1.0, 29, 0, 0, 0.0, 0.0 )
		else
			pMonster:AddTraceParticleToBone( "Drakeworm_Flame_04_R", 1.0, 29, 0, 0, 0.0, 0.0 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- ����
function DrakeWorm_Attack03Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetFly( false )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( true )
	elseif( iFrame == 29) then
		pMonster:SkillReadyEffectNoStop( 212, 0, 0, 1.5 )
	elseif( iFrame == 37 ) then
		pMonster:PlaySound( 998006 )
	elseif( iFrame == 40 ) then
		pMonster:StartAttack( 7, PAR_DOWN, 1.0, 23, 23, 13)	
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- ������ �ķ�ġ��
function DrakeWorm_Attack04Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetFly( false )
		pMonster:SetSuperArmor(true)
		pMonster:SetPushCheck( true )
	elseif( iFrame == 45 ) then
		pMonster:SetPushCheck( false )
		pMonster:PlaySound( 998007 )
	elseif( iFrame == 46 ) then
		--pMonster:StartAttack( 10, PAR_FRONTDOWN_LAST, 1.0, 1, 1, 13)
		pMonster:AddDamage(DT_DRAKEWORM_TAIL_STRIKE)
	elseif( iFrame == 98 ) then
		pMonster:SetPushCheck( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function DrakeWorm_Check_TurnToTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
        pMonster:SetState( "TURN" )
		pMonster:ResetDelay()
	end
end

function DrakeWorm_Check_Walk( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function DrakeWorm_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--if( pMonster:IsTarget() == true ) then
        pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	--end
end

function DrakeWorm_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if ( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK02" )
	else 
		pMonster:SetState( "ATTACK02_LONG" )
	end
	pMonster:ResetDelay()

	--[[
	--if( pMonster:IsTarget() == true ) then
		-- ATTACK02�� �������� ATTACK02_LONG�� �������� ���ؾ� ��!
        pMonster:SetState( "ATTACK02" )
        --pMonster:SetState( "ATTACK02_LONG" )
		pMonster:ResetDelay()
	--end
	--]]
end

function DrakeWorm_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--if( pMonster:IsTarget() == true ) then
        pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	--end
end

function DrakeWorm_Check_Attack04( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--if( pMonster:IsTarget() == true ) then
        pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	--end
end


-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnDrakeWorm_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnDrakeWorm_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetPushCheck( true )
	pMonster:SetFly( false )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
	if ( pMonster:FloatRand() < 0.1 and pMonster:IsSuperArmor() == false and pMonster:CheckState( "ASTAROT_METEOR" ) == false ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor(true)
	end
	
end
