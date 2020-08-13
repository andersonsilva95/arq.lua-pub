-- AI_SharkAron.lua

ActionList =
{
	-- ���
	{
		ID	  = "WAIT",
		Motion  = "SharkAron_Wait_A.frm",
		Func	= "SharkAron_WaitFunc",

		Trigger =
		{
			-- ����� ǥȿ
			{
				AICheckFrame		= 75,
				AIFunc				= "SharkAron_Check_WaitB",
				DelayFrame			= 550,
			},
			-- Ÿ���� ���� ��
			{
				AICheckFrame		= 35,
				AIFunc				= "SharkAron_Check_TurnToTarget",
				DelayFrame			= 35,
			},
			-- �ȱ�
			{
				AICheckFrame		= 35,
				AIFunc				= "SharkAron_Check_Walk",
				DelayFrame			= 80,
			},
			-- ��������
			{
				AICheckFrame		= 55,
				AIFunc				= "SharkAron_Check_JumpUp",
				DelayFrame			= 75,
			},
			-- �����ٿ�
			{
				AICheckFrame		= 80,
				AIFunc				= "SharkAron_Check_JumpDown",
				DelayFrame			= 85,
			},
			
			-- ��������
			{
				AICheckFrame		= 110,
				AIFunc				= "SharkAron_Check_Attack01",
				DelayFrame			= 150,
			},
			-- ī�������̺�
			{
				AICheckFrame		= 330,
				AIFunc				= "SharkAron_Check_Attack02",
				DelayFrame			= 400,
			},
			-- ����ġ��
			{
				AICheckFrame		= 165,
				AICheckFrame1       = 110,
				AICheckFrame2       = 55,
				AICheckFrame3       = 55,
				AIFunc				= "SharkAron_Check_Attack03",
				DelayFrame			= 90,
			},
			
			-- ��������
			{
				AICheckFrame		= 200,
				AIFunc				= "SharkAron_Check_Attack04",
				DelayFrame			= 400,
			},
		},
	},

	-- �̵�
	{
		ID	  = "WALK",
		Motion  = "SharkAron_Walk.frm",
		Func	= "SharkAron_WalkFunc",
		EnableMoveCheck = 1,
		MoveFailFunc	= "SharkAron_MoveFail",

		Trigger =
		{
			-- Ÿ���� ���� ��
			{
				AICheckFrame		= 75,
				AIFunc				= "SharkAron_Check_TurnToTarget",
				DelayFrame			= 75,
			},

			-- ��������
			{
				AICheckFrame		= 55,
				AIFunc				= "SharkAron_Check_JumpUp",
				DelayFrame			= 75,
			},
			-- �����ٿ�
			{
				AICheckFrame		= 110,
				AIFunc				= "SharkAron_Check_JumpDown",
				DelayFrame			= 110,
			},
			-- ����ġ��
			{
				AICheckFrame		= 75,
				AIFunc				= "SharkAron_Check_Attack03",
				DelayFrame			= 110,
			},
			-- ��������
			{
				AICheckFrame		= 110,
				AIFunc				= "SharkAron_Check_Attack01",
				DelayFrame			= 220,
			},
			-- �����ġ��
			{
				AICheckFrame		= 250,
				AIFunc				= "SharkAron_Check_Attack02",
				DelayFrame			= 400,
			},
		},
	},

	-- ��ȿ
	{
		ID	  = "UWA",
		Motion  = "SharkAron_Wait_B.frm",
		Func	= "SharkAron_WaitBFunc",
	},
	
	-- turn
	{
		ID	  = "TURN",
		Motion  = "SharkAron_Turn.frm",
		Func	= "SharkAron_TurnFunc",
	},
	
	-- ����
	{
		ID	  = "JUMP",
		Motion  = "SharkAron_Jump.frm",
		Func	= "SharkAron_JumpFuncUp",
	},

	-- �����ٿ�
	{
		ID	  = "JUMPDOWN",
		Motion  = "SharkAron_Jump_Down.frm",
		Func	= "SharkAron_JumpFunc",
	},

	-- ����
	{
		ID	  = "LANDING",
		Motion  = "SharkAron_Jump_Landing.frm",
		Func	= "SharkAron_JumpFunc",
	},

	-- ����01 ����� ����
	{
		ID	  = "ATTACK01_START",
		Motion  = "SharkAron_Attack01_Start.frm",
		Func	= "SharkAron_Attack01Func",
	},
	
	-- ����01 ����� ����
	{
		ID	  = "ATTACK01_ATK",
		Motion  = "SharkAron_Attack01_Attack.frm",
		Func	= "SharkAron_Attack01AtkFunc",
	},
	
	-- ����01 ����� ����
	{
		ID	  = "ATTACK01_END",
		Motion  = "SharkAron_Attack01_End.frm",
		Func	= "SharkAron_Attack01EndFunc",
	},

	-- ����02 ����� ���� ����
	{
		ID	  = "ATTACK02",
		Motion  = "SharkAron_Attack02_Start.frm",
		Func	= "SharkAron_Attack02Func",
	},
	
	-- ����02 ����� ���� ����
	{
		ID	  = "ATTACK02_ATK",
		Motion  = "SharkAron_Attack02_Attack.frm",
		Func	= "SharkAron_Attack02AtkFunc",
	},
	
	-- ����02 ����� ���� ����
	{
		ID	  = "ATTACK02_END",
		Motion  = "SharkAron_Attack02_End.frm",
		Func	= "SharkAron_Attack02EndFunc",
	},
	
	-- ����03 â 3�� �ֵθ��� 
	{
		ID	  = "ATTACK03",
		Motion  = "SharkAron_Attack03.frm",
		Func	= "SharkAron_Attack03Func",
	},
	
	-- ����04 ���� ���� �����Ŵ�~
	{
		ID	  = "ATTACK04",
		Motion  = "SharkAron_Attack04.frm",
		Func	= "SharkAron_Attack04Func",
	},
	
	-- ������ ��
	{
		ID	= "DAMAGE_MIDDLE",
		Motion  = "SharkAron_Damage_Middle.frm",
		Func	= "SharkAron_DamageFunc",
	},
	
	-- ������ ��
	{
		ID	= "DAMAGE_DOWN",
		Motion  = "SharkAron_Damage_Down.frm",
		Func	= "SharkAron_DamageFunc",
	},
	
	-- �ױ�
	{
		ID	  = "DIE",
		Motion  = "SharkAron_Die.frm",
		Func	= "SharkAron_DieFunc",
	},
}

CallBack =
{
	Land	= "OnSharkAron_Land",
	Die	 = "OnSharkAron_Die",
	Damage  = "OnSharkAron_Damage",
	--DefenceArrow = "",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitSharkAron( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function SharkAron_WaitFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--if( pMonster:FloatRand() < 0.1 ) then
	--	pMonster:PlaySound(999037)
	--end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )		
	end
end

-- ��� �� ǥȿ
function SharkAron_WaitBFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:PlaySound(999037)
	end
end

-- �ȱ� ����
function SharkAron_WalkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WALK" )
	end
end

-- ���� ����
function SharkAron_JumpFuncUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMPDOWN")
		pMonster:SetFrameLock( false )
	end

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end

-- ���� ����
function SharkAron_JumpFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
	end
end


-- ���� ����
function SharkAron_LandingFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  �������� ����
function SharkAron_Attack01Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 15 ) then
		pMonster:PlaySound(999038)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK01_ATK" )
	end
end

--  �������� ����
function SharkAron_Attack01AtkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 8 )
	elseif( iFrame == 2 ) then
		pMonster:StartAttack( 7, PAR_DOWN, 0.5, 8, 8, 19)
	elseif( iFrame == 17 ) then
		pMonster:PlaySound(999039)
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 8 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndAttack()
		if( pMonster:GetCountValue() >= 3 ) then
			pMonster:SetState( "ATTACK01_END" )
			pMonster:SetCountValue(0)
		else
			pMonster:AddCountValue(1)
			pMonster:SetState( "ATTACK01_ATK" )
		end
	end
end

--  �������� ����
function SharkAron_Attack01EndFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetSpeedX( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  ������ �پ�ٴϱ�!
function SharkAron_Attack02Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:StartText("JUMP")
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK02_ATK" )
		pMonster:PlaySound(999040)
	end
end

--  ������ �پ�ٴϱ�!
function SharkAron_Attack02AtkFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 2 ) then
		pMonster:SetInvincible( true )
		pMonster:SetTarget( 100, -800, 600, 800, -600 )
		pMonster:SetNoCheckContact( 50 )

        iTargetX = pMonster:GetTargetX()
        iTargetY = pMonster:GetTargetY()
        iX       = pMonster:GetX()
        iY       = pMonster:GetY()

        pMonster:SetSpeedX( ( iTargetX - iX ) / 80.0 )
        pMonster:SetSpeedY( 0.1 )
        pMonster:TurnToTarget()
	elseif( iFrame == 38 ) then
		pMonster:EarthQuake( 30, 0.06, 0.03 )
	elseif( iFrame == 40 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Black_Wendy_Shockwave", 0.10, -1.0 )
		else
			pMonster:AddParticleNoDirection( "Black_Wendy_Shockwave", -0.10, -1.0 )
		end
	end
	
	
	if( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetCountValue() >= 3 ) then
			pMonster:SetState( "ATTACK02_END" )
			pMonster:SetCountValue(0)
			
		else
			print(pMonster:GetCountValue())
			pMonster:AddCountValue(1)
			pMonster:SetState( "ATTACK02_ATK" )
		end
	end
	
	if( iFrame > 20 ) then
		if( pMonster:GetSpeedY() < 0.1 ) then
			pMonster:SetSpeedY( pMonster:GetSpeedY() - 0.01 )
		end
	end
end

--  ������ �پ�ٴϱ�!
function SharkAron_Attack02EndFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  â ���� �ֵθ���!
function SharkAron_Attack03Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 51 ) then
		pMonster:PlaySound(999041)
		pMonster:SetDrawSlash( 0 , true )
		pMonster:StartAttack( 3, PAR_BIG_DAMAGE, 0.2, 36, 37, 6)
	elseif( iFrame == 79 ) then
		pMonster:PlaySound(999041)
		pMonster:SetDrawSlash( 0 , true )
		pMonster:StartAttack( 3, PAR_BIG_DAMAGE, 0.2, 36, 37, 4)
	elseif( iFrame == 106 ) then
		pMonster:PlaySound(999041)
		pMonster:SetDrawSlash( 0 , true )
		pMonster:StartAttack( 5, PAR_FRONTDOWN_DROPDAMAGE_3, 0.2, 36, 37, 5)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetDrawSlash( 0 , false )
	end
end

--  ���� ���� �����Ŵ�!
function SharkAron_Attack04Func( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 17 ) then
		pMonster:PlaySound(999042)
	elseif( iFrame == 20 ) then 
		pMonster:PlaySound(999044)
	elseif( iFrame == 65 ) then 
		pMonster:AddDamageWithLocate(DT_ARME4_SPECIAL2,0,0)
		pMonster:AddDamageWithLocate(DT_ARME4_SPECIAL2_PARTICLE1,0,0)
		pMonster:AddDamageWithLocate(DT_ARME4_SPECIAL2_PARTICLE2,0,0)
	elseif( iFrame == 71 ) then
		pMonster:PlaySound(999043)
		pMonster:AddDamageWithLocate(DT_SHARKARON_ICESPEAR1, 0.0, 0.0)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- ������ ������
function SharkAron_DamageFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	if( iFrame <= 1 ) then
	
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-- �״»���
function SharkAron_DieFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound(999067)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()		
	end
end

function SharkAron_TurnFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:SetIsRight( not pMonster:GetIsRight() )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function SharkAron_Check_WaitB( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetState( "UWA" )
	pMonster:ResetDelay()
end

function SharkAron_Check_TurnToTarget( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:SetState("TURN")
		pMonster:ResetDelay()
	end
end

function SharkAron_Check_Walk( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end


function SharkAron_Check_Attack01( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 800, -700, 250, 700, -150 ) == true ) then
		pMonster:SetState( "ATTACK01_START" )
		pMonster:ResetDelay()
	end
end

function SharkAron_Check_Attack02( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 0, -600, 500, 600, -300 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function SharkAron_Check_Attack03( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 300, -300, 450, 300, -200 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end
function SharkAron_Check_Attack04( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 500, -500, 250, 500, -150 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function SharkAron_Check_JumpUp( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:CheckTargetInRange( 300, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		SharkAron_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

function SharkAron_Check_JumpDown( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

   if( pMonster:CheckTargetInRange( 30, -400, -40, 400, -1000 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetSpeedY( 0.01 )			
		pMonster:SetState( "JUMPDOWN" )
		pMonster:SetSuperArmor(true)
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnSharkAron_Land( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if ( pMonster:CheckState("ATTACK02_ATK") == false and pMonster:CheckState("ATTACK01_ATK") == false and pMonster:CheckState("ATTACK03") == false and pMonster:GetHP() > 0 ) then
		pMonster:TurnToTarget()
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "WAIT" )
	end
end

function OnSharkAron_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetState( "DIE" )
end

function OnSharkAron_Damage( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "JUMP" ) == false and pMonster:CheckState( "JUMPDOWN" ) == false ) then		
		pMonster:SetNoCheckContact( 0 )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	end
	
	if ( pMonster:FloatRand() < 0.1 and pMonster:IsSuperArmor() == false ) then	
		if ( pMonster:FloatRand() < 0.7 ) then
			pMonster:SetState( "ATTACK03" )
		else
			pMonster:SetState( "ATTACK04" )
		end
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor(true)
	end
	
	pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
end

function SharkAron_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(40)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.042 )			
		else
			pMonster:SetNoCheckContact(30)
			pMonster:SetState( "JUMPDOWN" )
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.0120)			
		end
	end
end

function SharkAron_Jump( iMonsterIndex )
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
