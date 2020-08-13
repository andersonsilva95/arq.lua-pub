-- AI_KaruelBorder_Cavalry.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Mon_Cavalry_f_Wait.frm",
        Func    = "KaruelBorderCavalry_WaitFunc",

        Trigger =
        {

			-- Ÿ����
            {
                AICheckFrame        = 30,
                AIFunc              = "KaruelBorderCavalry_Check_Targeting",
                DelayFrame          = 55,
            },
            -- Ÿ������
            {
                AICheckFrame        = 100,
                AIFunc              = "KaruelBorderCavalry_Check_ReleaseTarget",
                DelayFrame          = 50,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderCavalry_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- �ȱ�
            {
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderCavalry_Check_Walk",
                DelayFrame          = 100,
            },
            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderCavalry_Check_JumpUp",
                DelayFrame          = 55,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderCavalry_Check_JumpDown",
                DelayFrame          = 55,
            },
            -- ������(�̵�)
            {
                AICheckFrame        = 55,
                AIFunc              = "KaruelBorderCavalry_Check_Idle",
                DelayFrame          = 60,
            },
			-- Attack01
            {
                AICheckFrame        = 30,
                AIFunc              = "KaruelBorderCavalry_Check_Attack01",
                DelayFrame          = 60,
            },
			-- Attack02
            {
                AICheckFrame        = 45,
                AIFunc              = "KaruelBorderCavalry_Check_Attack02",
                DelayFrame          = 110,
            },
			-- Attack03
            {
                AICheckFrame        = 55,
                AIFunc              = "KaruelBorderCavalry_Check_Attack03",
                DelayFrame          = 220,
            },
        },
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Mon_Cavalry_f_run.frm",
        Func            = "KaruelBorderCavalry_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "KaruelBorderCavalry_MoveFail",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 50,
                AIFunc              = "KaruelBorderCavalry_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 100,
                AIFunc              = "KaruelBorderCavalry_Check_ReleaseTarget",
                DelayFrame          = 100,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderCavalry_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "KaruelBorderCavalry_Check_JumpUp",
                DelayFrame          = 55,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 35,
                AIFunc              = "KaruelBorderCavalry_Check_JumpDown",
                DelayFrame          = 55,
            },
			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "KaruelBorderCavalry_Check_Stop",
                DelayFrame          = 55,
            },
			-- ������(�̵�)
            {
                AICheckFrame        = 55,
                AIFunc              = "KaruelBorderCavalry_Check_Idle",
                DelayFrame          = 110,
            },
        }
    },
    
     -- ������
    {
        ID              = "IDLE",
        Motion          = "Mon_Cavalry_f_run.frm",
        Func            = "KaruelBorderCavalry_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "KaruelBorderCavalry_IdleMoveFail",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 40,
                AIFunc              = "KaruelBorderCavalry_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ������(����)
            {
                AICheckFrame        = 300,
                AIFunc              = "KaruelBorderCavalry_Check_Idle_Stop",
                DelayFrame          = 1100,
            },
        }
    },

    -- Attack01
    {
        ID      = "ATTACK01",
        Motion  = "Mon_Cavalry_f_Attack01.frm",
        Func    = "KaruelBorderCavalry_Attack01Func",
    },
    
    -- Attack02_READY
    {
        ID      = "ATTACK02_READY",
        Motion  = "Mon_Cavalry_f_Attack02_Ready.frm",
        Func    = "KaruelBorderCavalry_Attack02_ReadyFunc",
    },
	
    -- Attack02_ATTACK
    {
        ID      = "ATTACK02_ATTACK",
        Motion  = "Mon_Cavalry_f_Attack02_Attack.frm",
        Func    = "KaruelBorderCavalry_Attack02_AttackFunc",
    },
	
    -- Attack03
    {
        ID      = "ATTACK03",
        Motion  = "Mon_Cavalry_f_Attack03.frm",
        Func    = "KaruelBorderCavalry_Attack03Func",
    },
	
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Mon_Cavalry_f_Jump_Up.frm",
        Func    = "KaruelBorderCavalry_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Mon_Cavalry_f_Jump_Down.frm",
        Func    = "KaruelBorderCavalry_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Mon_Cavalry_f_Jump_Landing.frm",
        Func    = "KaruelBorderCavalry_ToWait",
    },

    -- �ױ� ����
    {
        ID      = "DIE",
        Motion  = "Mon_Cavalry_f_Die.frm",
        Func    = "KaruelBorderCavalry_DieFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
	-- ���� �����Ǿ����� ȣ��Ǵ� �ݹ��Լ���.
    Land    = "OnKaruelBorderCavalry_Land",
	-- ������ ȣ��Ǵ� �ݹ��Լ���.
    Die     = "OnKaruelBorderCavalry_Die",
	-- �������� �޾����� ���� ��� �� ȣ��Ǵ� �ݹ��Լ���.
    Damage  = "OnKaruelBorderCavalry_Damage",
	-- �������� �޾����� HP�� ���̱� ������ ȣ��Ǵ� �ݹ��Լ���.
	DamageBeforeChange = "OnKaruelBorderCavalry_DamageBeforeChange",
	-- �������� �޴� ���� ����� ȣ��Ǵ� �ݹ��Լ���.
	SyncDamage = "OnKaruelBorderCavalry_SyncDamage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitKaruelBorder_Cavalry( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetPushCheck( TRUE )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function KaruelBorderCavalry_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function KaruelBorderCavalry_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function KaruelBorderCavalry_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- �׾���
function KaruelBorderCavalry_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(607)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- Attack01
function KaruelBorderCavalry_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(2)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Dun_Karuel1_Cavalry_Lance_01", 0.0, 0.05 )
			pMonster:AddParticle( "Dun_Karuel1_Cavalry_Lance_02", 0.0, 0.05 )
			pMonster:AddParticle( "Dun_Karuel1_Cavalry_Lance_03", 0.0, 0.05 )
			pMonster:AddParticle( "Dun_Karuel1_Cavalry_Lance_04", 0.0, 0.05 )
		else
			pMonster:AddParticle( "Dun_Karuel1_Cavalry_Lance_01", 0.0, 0.05 )
			pMonster:AddParticle( "Dun_Karuel1_Cavalry_Lance_02", 0.0, 0.05 )
			pMonster:AddParticle( "Dun_Karuel1_Cavalry_Lance_03_R", 0.0, 0.05 )
			pMonster:AddParticle( "Dun_Karuel1_Cavalry_Lance_04", 0.0, 0.05 )
		end
		pMonster:AddDamage( DT_KARUELBORDER_CAVALRY_ATTACK01_FRONT )
	elseif( iFrame == 65 ) then
		pMonster:AddDamage( DT_KARUELBORDER_CAVALRY_ATTACK01_BACK )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

-- Attack02_Ready
function KaruelBorderCavalry_Attack02_ReadyFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:PlaySound(40010)
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "ATTACK02_ATTACK" )
    end
end

-- Attack02_Attack
function KaruelBorderCavalry_Attack02_AttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_CAVALRY_ATTACK02, 0.0, 0.0, true )
		else
			pMonster:AddDamageWithLocateDirect( DT_KARUELBORDER_CAVALRY_ATTACK02_R, 0.0, 0.0, true )
		end
		pMonster:PlaySound(40014)		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- Attack03
function KaruelBorderCavalry_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 10 ) then
			pMonster:PlaySound(986035)
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(995040)
		--pMonster:AddParticle( "Dun_Karuel1_Cavalry_Breath_01", 0.45, 0.2 )
		--pMonster:AddParticle( "Dun_Karuel1_Cavalry_Breath_02", 0.45, 0.2 )
		--pMonster:AddParticle( "Dun_Karuel1_Cavalry_Breath_03", 0.45, 0.2 )
		--pMonster:AddParticle( "Dun_Karuel1_Cavalry_Breath_04", 0.45, 0.2 )
		--pMonster:AddParticle( "Dun_Karuel1_Cavalry_Breath_05", 0.45, 0.2 )
		if( 2 <= g_MyD3D:GetDungeonLevel() ) then
			pMonster:AddDamage( DT_KARUELBORDER_CAVALRY_ATTACK03_ADDEFF )
		else
			pMonster:AddDamage( DT_KARUELBORDER_CAVALRY_ATTACK03 )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ���� ����
function KaruelBorderCavalry_JumpFunc( iMonsterIndex, iFrame )
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
function KaruelBorderCavalry_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  �������� ����Ʈ�� ���ư��� ����
function KaruelBorderCavalry_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function KaruelBorderCavalry_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -430, 360, 430, -260 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function KaruelBorderCavalry_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -500, 400, 500, -400 ) == false ) then
		pMonster:ReleaseTarget( true )
		pMonster:ResetDelay()
	end
end

function KaruelBorderCavalry_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function KaruelBorderCavalry_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 80, -150, 360, 150, -400 ) == false or pMonster:FloatRand() < 0.05  ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderCavalry_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -400, 860, 400, 70 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		KaruelBorderCavalry_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderCavalry_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -250, -100, 250, -800 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderCavalry_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 60, -200, 360, 200, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderCavalry_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -220, 50, 220, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderCavalry_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 350, -300, 50, 300, -100 ) == true ) then
		pMonster:SetState( "ATTACK02_READY" )
		pMonster:ResetDelay()
	end
end

function KaruelBorderCavalry_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -300, 50, 300, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

-- ������..  ���� �ٲٱ� �� �̵�
function KaruelBorderCavalry_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function KaruelBorderCavalry_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false and pMonster:FloatRand() < 0.75 ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnKaruelBorderCavalry_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end
end

function OnKaruelBorderCavalry_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE" )
end

function OnKaruelBorderCavalry_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	
	-- ���� �߿� �¾�����
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
	
	-- �ݰ�
	if ( pMonster:FloatRand() < 0.08 and pMonster:GetIsContact() == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
	end
end

function OnKaruelBorderCavalry_DamageBeforeChange( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( false == pMonster:IsBackAttack() and false == pMonster:IsSpecialAttack() ) then
		local iAbsorbHP = pMonster:GetDamageDiff() * 0.5
		pMonster:SetDamageDiff( iAbsorbHP )
		--pMonster:SetMagicEffect_NotMeBroad( iMonsterIndex, EGC_EFFECT_KARUELBORDER_CAVALRY_GUARD, 1.0, 1 )
		pMonster:ResetDelay()
	end
end

function OnKaruelBorderCavalry_SyncDamage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( false == pMonster:IsBackAttack() and false == pMonster:IsSpecialAttack() ) then
		pMonster:AddParticle( "Dun_Karuel1_Cavalry_Shield", 0.0, 0.27  )
		pMonster:PlaySound( 753 )
		pMonster:ResetDelay()
	end
end

function KaruelBorderCavalry_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function KaruelBorderCavalry_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )
		end
    else
		pMonster:SetState( "WAIT" )
		pMonster:SetSpeedX( 0 )
	end
end

function KaruelBorderCavalry_IdleMoveFail( iMonsterIndex )
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