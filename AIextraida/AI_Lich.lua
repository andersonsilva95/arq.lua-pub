-- AI_Lich.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Lich_Wait.frm",
        Func    = "Lich_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Lich_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "Lich_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "Lich_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- �ȱ�
            {
                AICheckFrame        = 75,
                AIFunc              = "Lich_Check_Walk",
                DelayFrame          = 150,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "Lich_Check_Attack01",
                DelayFrame          = 75,
            },
            -- ����Ʈ�� ����
            {
                AICheckFrame        = 55,
                AIFunc              = "Lich_Check_Attack02",
                DelayFrame          = 220,
            },
            -- �ӹڰ���
            {
                AICheckFrame        = 110,
                AIFunc              = "Lich_Check_Attack03",
                DelayFrame          = 550,
            },
            
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "Lich_Check_HighJump",
                DelayFrame          = 55,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Lich_Check_JumpDown",
                DelayFrame          = 55,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Lich_Walk.frm",
        Func    = "Lich_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Lich_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Lich_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "Lich_Check_TurnToTarget",
                DelayFrame          = 55,
            },       
            -- ��������
            {
                AICheckFrame        = 25,
                AIFunc              = "Lich_Check_Attack01",
                DelayFrame          = 110,
            },            
            -- ����Ʈ�� ����
            {
                AICheckFrame        = 55,
                AIFunc              = "Lich_Check_Attack02",
                DelayFrame          = 110,
            },
            -- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "Lich_Check_HighJump",
                DelayFrame          = 75,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Lich_Check_JumpDown",
                DelayFrame          = 55,
            },
        }
    },
    
    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Lich_Attack01.frm",
        Func    = "Lich_Attack01Func",
    },
    
    -- ����Ʈ�� ����
    {
        ID      = "ATTACK02",
        Motion  = "Lich_Attack02.frm",
        Func    = "Lich_Attack02Func",
    },
    
    -- �ӹ�
    {
        ID      = "ATTACK03",
        Motion  = "Lich_Attack03.frm",
        Func    = "Lich_Attack03Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Lich_Jump.frm",
        Func    = "Lich_JumpFunc",
    },
    
    -- ���� ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Lich_Jump_Landing.frm",
        Func    = "Lich_JumpLandingFunc",
    },
    

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Lich_Damage_Up.frm",
        Func    = "Lich_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Lich_Damage_Middle.frm",
        Func    = "Lich_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Lich_Damage_Down.frm",
        Func    = "Lich_DamageFunc",
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_UP",
        Motion  = "Lich_Down_Up.frm",
        Func    = "Lich_DownUpFunc",
    },
    
    -- �ٿ� ����� 
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Lich_Down_Special.frm",
        Func    = "Lich_DownUpFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Lich_Die.frm",
        Func    = "Lich_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    --[[
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Lich_Stone.frm",
        Func    = "Lich_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Lich_Stone.frm",
        Func    = "Lich_IceCurseFunc",
    },
    --]]
}

CallBack =
{
    Land    = "OnLich_Land",
    Die     = "OnLich_Die",
    Damage  = "OnLich_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitLich( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    --pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    --pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Lich_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

function Lich_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1100, 900, 1100, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end


-- �ȱ� ����
function Lich_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

--  ��������01 ����
function Lich_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 33 ) then
		pMonster:AddDamage( DT_MONSTER_LICH01 )
		pMonster:PlaySound(343)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ʈ�� ����
function Lich_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then	
		pMonster:SetSuperArmor( true )	    
	elseif( iFrame == 50 ) then
		pMonster:PlaySound(41)		
	elseif( iFrame >= 51 and iFrame < 91 ) then
		if( math.mod( iFrame, 2 ) == 0 ) then
			pMonster:AddDamageWithLocate( DT_LIGHTNING_GENERATE1, 0.5, 0.05 )
			pMonster:AddDamageWithLocate( DT_LIGHTNING_BOLT, 0.45, 0.05 )
			pMonster:AddDamageWithLocate( DT_LIGHTNING_BOLT, 1.45, 0.05 )
			pMonster:AddDamageWithLocate( DT_LIGHTNING_BOLT, 2.45, 0.05 )
		end		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �ӹڰ��� ����
function Lich_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 30 ) then
	    pMonster:SkillReadyEffectNoStop( 80, 60, 100, 0.0 )
	elseif( iFrame >= 50 and iFrame <= 60 ) then
		if( iFrame == 51 ) then
			pMonster:PlaySound(351)
		end
	    if( iFrame == 50 ) then
	                            -- ������
	        pMonster:FreezeAttack( -0.01, true )
	    else
	        pMonster:FreezeAttack( -0.01, false )
	    end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���� ����
function Lich_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �������� ����
function Lich_JumpLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �״»���
function Lich_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Lich_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ�
function Lich_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function Lich_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE" )
        end        
    end
end


-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Lich_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Lich_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Lich_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Lich_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 600, 150, 150 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Lich_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Lich_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

   if( pMonster:CheckTargetInRange( 60, -100, -80, 100, -1000 ) == true ) then
        pMonster:SetNoCheckContact(25)
        pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedY( 0.01 )            
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Lich_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 100, 100, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Lich_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -200, 150, 200, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
    end
end

function Lich_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -200, 400, 200, -300 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Lich_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function Lich_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

function Lich_Process_Jump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    --pMonster:SetPushCheck( false )

    if( iFrame == 33 ) then
        pMonster:SetNoCheckContact( 62 )

        iTargetX = pMonster:GetTargetX()
        iTargetY = pMonster:GetTargetY()
        iX       = pMonster:GetX()
        iY       = pMonster:GetY()

        pMonster:SetSpeedX( ( iTargetX - iX ) / 80.0 )

        if( iTargetY - iY >= -0.25 ) and ( iTargetY - iY < 0.25 ) then
            pMonster:SetSpeedY( 0.061 )   -- ���� y���� ������ �������� ����..
        elseif( iTargetY - iY >= 0.25 ) and ( iTargetY - iY < 0.5 ) then
            pMonster:SetSpeedY( 0.066 )   -- Ÿ���� ���� �������� ������..
        elseif( iTargetY - iY >= -0.5 ) and ( iTargetY - iY < -0.25 ) then
            pMonster:SetSpeedY( 0.050 )    -- Ÿ���� ���� �������� ������..
        elseif( iTargetY - iY >= 0.5 ) then
            pMonster:SetSpeedY( 0.071 )
        elseif( iTargetY - iY < -0.5 ) then
            pMonster:SetSpeedY( 0.042 )
        end

        pMonster:TurnToTarget()
     elseif( iFrame > 71 ) then
		if( pMonster:GetSpeedY() < 0.1 ) then
			pMonster:SetSpeedY( pMonster:GetSpeedY() - 0.0035 )
		end
     end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnLich_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "JUMP" ) == true ) then		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "JUMP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP" ) == true ) then
		pMonster:SetPushCheck( true )
        --pMonster:SetState( "WAIT" )
    end    
end

function OnLich_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetState( "DIE" )
	end	
end

function OnLich_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetPushCheck( true )		
	
	if( pMonster:CheckState( "DOWN_UP" ) == true ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
		pMonster:SetNoCheckContact(10)
		pMonster:SetSpeedY( 0.020 )
	else
		pMonster:SetSpeedX( 2.0 * pMonster:GetSpeedX() / 3.0 )
		pMonster:SetSpeedY( 2.0 * pMonster:GetSpeedY() / 3.0 )
	end
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )		
	end
end

function Lich_Jump( iMonsterIndex )
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

function Lich_MoveFail( iMonsterIndex )
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
